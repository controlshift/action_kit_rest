require 'spec_helper'

describe ActionKitRest::API do
  subject { described_class.new(options) }

  it { described_class.included_modules.should include ActionKitRest::Authorization }
  it { described_class.included_modules.should include ActionKitRest::Connection }
  it { described_class.included_modules.should include ActionKitRest::Request }


  describe '#extract_id_from_location' do
    let(:options) { {} }
    it "should extract the id" do
      subject.send(:extract_id_from_location, "https://roboticdogs.actionkit.com/rest/v1/importpage/1093/").should == "1093"
    end
  end


  context 'process_basic_auth' do
    let(:options) { { :basic_auth => 'login:password' } }

    its(:username) { should eq 'login' }

    its(:password) { should eq 'password' }

    its(:basic_auth) { should eq 'login:password' }
  end


end