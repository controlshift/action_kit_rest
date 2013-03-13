require 'spec_helper'

describe ActionKitRest::Configuration do
  let(:klass) {
    ::Class.new do
      extend ActionKitRest::Configuration
    end
  }

  subject { klass }

  its(:adapter) { should == described_class::DEFAULT_ADAPTER }

  its(:ssl) { should == described_class::DEFAULT_SSL }

  its(:ssl) { should be_a Hash }

  its(:user_agent) { should == described_class::DEFAULT_USER_AGENT }

  its(:connection_options) { should be_a Hash }

  its(:connection_options) { should be_empty }

  its(:username) { should == described_class::DEFAULT_USERNAME }

  its(:password) { should == described_class::DEFAULT_PASSWORD }

  describe ".configure" do
    it { should respond_to :configure }

    described_class.keys.each do |key|
      it "should set the #{key}" do
        subject.configure do |config|
          config.send("#{key}=", key)
          subject.send(key).should == key
        end
      end
    end
  end

end