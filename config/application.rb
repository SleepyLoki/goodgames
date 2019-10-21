require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Goodgames
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

class Application < Rails::Application
  # Access-Control-Allow-Origin
  config.middleware.use Rack::Cors do
    allow do
      origins '*'
      resource %r{/users/\d+.json},
        :headers => ['Origin', 'Accept', 'Content-Type'],
        :methods => [:put, :delete]
    end
  end
end

class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :bio, :email, :password]) 
            devise_parameter_sanitizer.permit(:account_update, keys:[:first_name, :last_name, :bio, :email, :password]) 
        end
end
