require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Connectdots
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # These paths will be ignored when redirecting the user to last visited page
    # Devise routes need to be here always, so that a redirect loop does not occur
    # after signing in
    config.ignored_paths = %W(/users /users/sign_in /users/sign_up /users/password /users/sign_out /users/confirm_password)
  end
end
