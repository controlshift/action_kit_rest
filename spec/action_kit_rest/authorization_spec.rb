require 'spec_helper'

describe ActionKitRest::Authorization do
  let(:options) { {} }

  subject(:ak) { ActionKitRest.new options }

  after do
    reset_authentication_for ak
  end

  context ".authenticated?" do
    it { should respond_to(:authenticated?) }
  end

  context "authentication" do

    context 'username & password' do
      let(:options) { { :username => 'ak', :password => 'pass' } }

      it "should return hash with username & password params" do
        ak.basic_auth.should == "#{options[:username]}:#{options[:password]}"
      end
    end
  end
end # authentication
