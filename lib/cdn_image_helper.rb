require "cdn_image_helper/version"
require 'cdn_image_helper/railtie' if defined?(Rails)

module CdnImageHelper

  class <<self
    attr_accessor :app_url, :cdn_host
  end

  def render_with_cdn_images(text, size = :medium)
    return text unless text.respond_to?(:gsub)

    escaped_app_url = Regexp.escape(CdnImageHelper.app_url)
    text.gsub(/(href|src)="(#{escaped_app_url}(\.tw)?)?\/system\/images\/(\d+)\/(\w+)\//) do |match|
      link_type, host, tw, id, scale = $1, $2, $3, $4, $5
      new_size = (link_type == "href") ? :original : size
      path = "/system/images/#{id}/#{new_size}/"
      %|#{link_type}="#{Rails.env.production? ? cdn_url_for(path) : path}|
    end
  end

  def render_with_cdn_excerpt_images(text, size = :medium)
    return text unless text.respond_to?(:gsub)

    escaped_app_url = Regexp.escape(CdnImageHelper.app_url)
    text.gsub(/(#{escaped_app_url}(\.tw)?)?\/system\/excerpt_images\/(\d+)\/(\w+)\//) do |match|
      host, tw, id, scale = $1, $2, $3, $4
      path = "/system/excerpt_images/#{id}/#{size}/"
      Rails.env.production? ? cdn_url_for(path) : path
    end
  end

  def replace_image_size(text, size = :medium)
    return text unless text.respond_to?(:gsub)

    text.gsub(/\/system\/images\/(\d+)\/(\w+)\//) do |match|
      id, scale = $1, $2
      %|/system/images/#{id}/#{size}/|
    end
  end

  def cdn_url_for(path, cdn_host = CdnImageHelper.cdn_host)
    cdn_number = Digest::MD5.hexdigest(path).to_i(16) % 4
    cdn_host = cdn_host % cdn_number
    "#{cdn_host}#{path}"
  end

end
