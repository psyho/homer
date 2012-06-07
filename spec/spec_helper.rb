require 'rr'

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each do |file|
  require file
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.color_enabled = true

  config.mock_with :rr

  config.include IntegrationSpecHelpers, :integration

  config.before(:each, :integration) { create_test_directory }
  config.after(:each, :integration) { remove_test_directory }
end
