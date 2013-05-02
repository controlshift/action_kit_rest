require 'spec_helper'

describe ActionKitRest do
  describe 'logging' do
    it "should have a logger" do
      ActionKitRest.respond_to?(:logger).should be_true
    end

    it "should be able to log debug methods" do
      ActionKitRest.logger.respond_to?(:debug).should be_true
    end

    it "should be settable" do
      ActionKitRest.respond_to?(:logger=).should be_true
      log = mock()
      ActionKitRest.logger = log
      ActionKitRest.logger.should == log
    end
  end
end