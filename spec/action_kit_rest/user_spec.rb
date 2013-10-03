require 'spec_helper'

describe ActionKitRest::User do
  before(:each) do
    @actionkit = ActionKitRest.new(host: 'test.com')

    logger = mock
    logger.stub(:debug).and_return(true)

    ActionKitRest.stub(:logger).and_return(logger)
    Vertebrae::Base.stub(:logger).and_return(logger)
  end



  describe "retrieval" do
    before(:each) do
      stub_get(request_path).to_return(:body => body, :status => status,
                                       :headers => {:content_type => "application/json; charset=utf-8"})
    end

    describe ".get" do
      let(:status) { 200 }
      let(:body) { fixture('user/object.json') }
      let(:request_path) { 'user/1/' }
      
      it 'should return a user object' do
        @actionkit.user.get(1).email.should == 'walkers@wawd.com'
      end
    end
  end
end