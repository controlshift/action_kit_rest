require 'spec_helper'

describe ActionKitRest::API do
  subject { described_class.new(options) }

  it { described_class.included_modules.should include Vertebrae::Authorization }
  it { described_class.included_modules.should include Vertebrae::Connection }
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

  describe "should remember the host" do

    before(:each) do
      logger = mock
      logger.stub(:debug).and_return(true)

      ActionKitRest.stub(:logger).and_return(logger)
      Vertebrae::Base.stub(:logger).and_return(logger)
    end

    let(:subject){ ActionKitRest::API.new(host: 'localhost.com') }

    it "should have a host" do
      subject.host.should == 'localhost.com'
    end

    it "should be in the current_options" do
      subject.current_options[:host].should == 'localhost.com'
    end

    it "should be set on the connection" do
      subject.connection(subject.current_options).host.should == 'localhost.com'
    end
  end
end