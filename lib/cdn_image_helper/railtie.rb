require "cdn_image_helper"

module CdnImageHelper
  class Railtie < Rails::Railtie
    initializer "cdn_image_helper.view_helpers" do
      ActionView::Base.send :include, CdnImageHelper
    end
  end
end
