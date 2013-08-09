require 'spec_helper'

describe ActionKitRest::Page do
  before(:each) do
    @actionkit = ActionKitRest.new(host: 'test.com')

    logger = mock
    logger.stub(:debug).and_return(true)

    ActionKitRest.stub(:logger).and_return(logger)
    Vertebrae::Base.stub(:logger).and_return(logger)
  end

  describe 'configuration' do
    it 'should propagate the host to the page' do
      @actionkit.connection.configuration.host.should == 'test.com'
    end

    it "should have a client" do
      @actionkit.page.client.should_not be_nil
    end
  end


  describe "retrieval" do
    before(:each) do
      stub_get(request_path).to_return(:body => body, :status => status,
                                       :headers => {:content_type => "application/json; charset=utf-8"})
    end

    describe ".list" do
      let(:status) { 200 }
      let(:body) { fixture('page/collection.json') }
      let(:request_path) { 'page/' }

      it "should allow listing the objects" do
        pages = @actionkit.page.list

        pages.should be_an_instance_of(ActionKitRest::Response::Wrapper)

        pages.each do | obj |
          obj.should be_an_instance_of(Hashie::Mash)
          obj.should respond_to(:goal)
        end
      end
    end

    describe ".page" do

      let(:body) { fixture('page/object.json') }
      let(:request_path) { 'page/1/' }

      describe "success" do
        let(:status) { 200 }
        it "should return a single object" do
          page = @actionkit.page.get(1)
          page.goal.should == 10
        end
      end

      describe "not found" do
        let(:status) { 404 }

        it "should return nil" do
          lambda{ @actionkit.page.get(1).should == nil }.should raise_exception(ActionKitRest::Response::NotFound)
        end
      end
      
      describe "error" do
        let(:status) { 400 }
        let(:body) { fixture('error.json') }
        
        it "should raise an ak validation response error" do
          lambda{ @actionkit.page.get(1) }.should raise_exception(ActionKitRest::Response::ValidationError)
        end  
      end

      describe "an error" do
        let(:status) { 500 }

        it "should return nil" do
          lambda{ @actionkit.page.get(1).should == nil }.should raise_exception
        end
      end
    end
  end
end