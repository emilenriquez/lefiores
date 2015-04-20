require File.expand_path('../boot', __FILE__)

#require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
require "action_controller/railtie"
require "action_mailer/railtie"
#require "active_resource/railtie" # Comment this line for Rails 4.0+
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Lefiores
  class Application < Rails::Application

    config.generators do |g|
      g.template_engine :haml
    end

    config.assets.precompile += ["codemirror*", "codemirror/**/*"]
    config.assets.precompile += ['*.js', '*.css']
    config.assets.precompile += ['uikit*', 'uikit/**/*']
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
    config.autoload_paths += %W(#{config.root}/lib) # add this line
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    #config.active_record.raise_in_transactional_callbacks = true
  end
end
