require 'rspec'

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'action_kit_rest'

RSpec.configure do |config|

end

def reset_authentication_for(object)
  [ 'username', 'password' ].each do |item|
    ActionKitRest.send("#{item}=", nil)
    object.send("#{item}=", nil)
  end
end
