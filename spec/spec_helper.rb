require 'rspec'
require 'webmock/rspec'

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'action_kit_rest'

RSpec.configure do |config|
  config.include WebMock::API

  config.before(:each) do
    WebMock.reset!
  end
  config.after(:each) do
    WebMock.reset!
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = [:should, :expect]
  end

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

def stub_get(path)
  stub_action_kit_request(:get, path)
end

def stub_post(path)
  stub_action_kit_request(:post, path)
end

def stub_put(path)
  stub_action_kit_request(:put, path)
end

def stub_action_kit_request(method, path)
  stub_request(method, 'https://test.com/rest/v1/' + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(File.join(fixture_path, '/', file))
end
