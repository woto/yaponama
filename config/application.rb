require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Yaponama
  class Application < Rails::Application

    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)

    config.to_prepare do
      Devise::RegistrationsController.class_eval do
        def build_resource(hash=nil)
          super(hash)
          self.resource.captcha_verification = session[:captcha]
        end
      end
    end

  end
end
