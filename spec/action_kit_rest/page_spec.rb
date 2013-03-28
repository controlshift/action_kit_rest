require 'spec_helper'

describe ActionKitRest::Page do
  before(:each) do
    @actionkit = ActionKitRest.new(host: 'test.com')
  end

  let(:status) { 200 }

  describe "retrieval" do
    before(:each) do
      stub_get(request_path).to_return(:body => body, :status => status,
                                       :headers => {:content_type => "application/json; charset=utf-8"})
    end

    describe ".list" do
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

      it "should return a single object" do
        page = @actionkit.page.get(1)
        page.goal.should == 10
      end
    end
  end

  describe "creation" do
    let(:body) { "" }
    let(:request_body) { {title: "Title", name: "name"}.to_json  }
    let(:request_path) { 'page/' }

    before(:each) do
      stub_post(request_path).with(body: request_body).to_return(:body => body, :status => status,
                                        :headers => {:content_type => "application/json; charset=utf-8"})
    end

    describe ".create" do
      it "should allow creation" do
        @actionkit.page.create(title: "Title", name: "name")
      end
    end
  end
end