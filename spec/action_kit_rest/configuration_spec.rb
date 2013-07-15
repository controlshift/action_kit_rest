require 'spec_helper'

describe ActionKitRest::Configuration do

  subject { ActionKitRest }

  its(:prefix) { should == '/rest/v1/'}
end