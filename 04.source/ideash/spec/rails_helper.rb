#RailsにおいてRSpecを利用する際に、共通の設定を書いておくファイルである。
# 各テスト用ファイルでこのファイルを読み込むことで、共通の設定や、メソッドを適用する
#
#
#
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  #factorybotの記述を楽にする
  config.include FactoryBot::Syntax::Methods
  #deviseのtest_helperとmacrosをコントローラーで使えるようにする
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, :type => :controller
  #config.include ControllerMacros, type: :controller
end

#deviseとcontroller_macrosを読み込む
require 'devise'
require File.expand_path("spec/support/controller_macros.rb")

#capybara
require 'capybara/rspec'
