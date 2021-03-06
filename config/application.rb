
require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Projeto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Whitelist locales available for the application
    I18n.available_locales = [:en, :br]

    # Set default locale to something other than :en
    I18n.default_locale = :br

    # RSpec para testar apenas os models
    config.generators do |g|
      g.test_framework :rspec, :view_specs       => false,
                               :controller_specs => false,
                               :helper_specs     => false,
                               :routing_specs    => false,
                               :request_specs    => false
    end
  end
end
