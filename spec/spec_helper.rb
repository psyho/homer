require_relative '../lib/homer'

require 'mocha'
require 'webmock'
require 'vcr'

require 'bogus'
require 'bogus/rspec'

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each do |file|
  require file
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.color_enabled = true

  config.mock_with :mocha

  config.include IntegrationSpecHelpers, :integration

  config.before(:each, :integration) { create_test_directory }
  config.after(:each, :integration) { remove_test_directory }
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

Bogus.configure do |config|
  config.search_modules << Homer
end

Mocha::Configuration.prevent(:stubbing_non_existent_method)
