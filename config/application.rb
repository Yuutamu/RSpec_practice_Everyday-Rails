require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Projects
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      g.test_framework :rspec,
        # fixtures: false, # テストデータベースにレコード作成するファイルの作成をスキップ
        view_specs: false, # SystemSPec で UIテストをするので不要
        helper_specs: false,
        routing_specs: false
      # g.factory_bot false # 4章で利用するFactoryBot 現段階では不要
    end
  end
end
