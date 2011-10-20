require "cdn_image_helper/version"
require 'cdn_image_helper/railtie' if defined?(Rails)

module CdnImageHelper
  
  class <<self
    attr_accessor :app_url, :cdn_host
  end
  
  def render_with_cdn_images(text, size = :medium)
    return text unless text.respond_to?(:gsub)
    text.gsub(/(href|src)="(#{CdnImageHelper.app_url})?\/system\/images\/(\d+)\/(\w+)\//) do |match|
      link_type, host, id, scale = $1, $2, $3, $4
      cdn_host = CdnImageHelper.cdn_host % rand(4) if Rails.env.production?
      new_size = link_type == "href" ? :original : size
      %|#{link_type}="#{cdn_host}/system/images/#{id}/#{new_size}/|
    end
  end

  def render_with_cdn_excerpt_images(text, size = :medium)
    return text unless text.respond_to?(:gsub)
    text.gsub(/(#{CdnImageHelper.app_url})?\/system\/excerpt_images\/(\d+)\/(\w+)\//) do |match|
      host, id, scale = $1, $2, $3
      cdn_host = CdnImageHelper.cdn_host % rand(4) if Rails.env.production?
      %|#{cdn_host}/system/excerpt_images/#{id}/#{size}/|
    end
  end

  def replace_image_size(text, size = :medium)
    return text unless text.respond_to?(:gsub)
    text.gsub(/\/system\/images\/(\d+)\/(\w+)\//) do |match|
      id, scale = $1, $2
      %|/system/images/#{id}/#{size}/|
    end
  end
  
end