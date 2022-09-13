# This is an _environment variable_ that is used by some of the Rake tasks to determine
# if our application is running locally in development, in a test environment, or in production
ENV['RACK_ENV'] ||= "development"

# Require in Gems
require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])

# Require Carrierwave for file uploads
require 'carrierwave'
require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
    config.root = "./public"
end

# Require in all files in 'app' directory
require_all 'app'
