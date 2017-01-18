require 'spec_helper'

describe ActionKitRest::Page do
  subject { ActionKitRest.new(host: 'test.com') }

  before(:each) do
    logger = double
    logger.stub(:debug).and_return(true)

    ActionKitRest.stub(:logger).and_return(logger)
    Vertebrae::Base.stub(:logger).and_return(logger)
  end

  describe 'configuration' do
    it 'should propagate the host to the page' do
      subject.connection.configuration.host.should == 'test.com'
    end

    it "should have a client" do
      subject.page.client.should_not be_nil
    end

    describe 'adapter' do
      subject { ActionKitRest.new(host: 'test.com', adapter: :em_synchrony) }

      it 'should propagate the adapter' do
        subject.connection.configuration.adapter.should == :em_synchrony
      end
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
        pages = subject.page.list

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
          page = subject.page.get(1)
          page.goal.should == 10
        end
      end

      describe "not found" do
        let(:status) { 404 }

        it "should return nil" do
          lambda{ subject.page.get(1).should == nil }.should raise_exception(ActionKitRest::Response::NotFound)
        end
      end
      
      describe "error" do
        let(:status) { 400 }
        let(:body) { fixture('error.json') }
        
        it "should raise an ak validation response error" do
          lambda{ subject.page.get(1) }.should raise_exception(ActionKitRest::Response::ValidationError)
        end  
      end

      describe "an error" do
        let(:status) { 500 }

        it "should return nil" do
          lambda{ subject.page.get(1).should == nil }.should raise_exception(StandardError)
        end
      end

      describe 'try again' do
        let(:status) { 500 }
        let(:body) { '{"error": "Sorry, this request could not be processed. Please try again later."}' }
        it "should return nil" do
          lambda{ subject.page.get(1).should == nil }.should raise_exception(ActionKitRest::Response::TryAgainLater)
        end
      end
    end
  end
end
