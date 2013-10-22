require 'spec_helper'

describe ActionKitRest::Response::Wrapper do
  describe 'initialization' do
    it "should be kind 'object' for objects" do
      body = double
      response = double(:body => body)

      wrapper = ActionKitRest::Response::Wrapper.new(response)

      wrapper.object?.should be_true
      wrapper.collection?.should be_false
    end

    it "should be kind 'collection' for collections" do
      body = double(:meta => '', :objects => [])
      response = double(:body => body)

      wrapper = ActionKitRest::Response::Wrapper.new(response)

      wrapper.object?.should be_false
      wrapper.collection?.should be_true
    end
  end
end