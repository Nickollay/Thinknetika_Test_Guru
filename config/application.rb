require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.time_zone = 'Moscow'

    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.available_locales = [:en, :ru]
    config.i18n.default_locale = :ru

    config.middleware.use I18n::JS::Middleware

    config.autoload_paths << "#{Rails.root}/lib/clients"

    config.assets.version = '1.01'

    Bundler.require(*Rails.groups)

    unless ENV['RAILS_ENV'] == 'production'
      Dotenv::Railtie.load
    end

    config.assets.initialize_on_precompile = true # enabled due to i18n-js
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
