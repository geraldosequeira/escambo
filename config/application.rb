require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Escambo
  class Application < Rails::Application

    config.load_defaults 5.2

    config.i18n.default_locale = "pt-BR"
    config.time_zone = "Brasilia"
    Money.locale_backend = :i18n

    config.generators.system_tests = nil
  end
end
