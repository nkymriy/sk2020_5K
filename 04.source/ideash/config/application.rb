require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ideash
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.autoload_paths += %W(#{config.root}/lib)

    config.cache_store = :redis_cache_store
    #タイムゾーンを東京に
    config.time_zone = 'Tokyo'
    # deviseで利用する言語を日本語に
    config.i18n.default_locale = :ja
    # 自動挿入を防ぐように
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
