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

end

def stub_get(path, prefix = ActionKitRest.prefix.to_s)
  stub_request(:get, "https://test.com" + prefix + path)
end

def reset_authentication_for(object)
  [ 'username', 'password' ].each do |item|
    ActionKitRest.send("#{item}=", nil)
    object.send("#{item}=", nil)
  end
end


def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(File.join(fixture_path, '/', file))
end