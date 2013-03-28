require 'spec_helper'

describe ActionKitRest::Page do
  before(:each) do
    @actionkit = ActionKitRest.new(host: 'test.com')
  end



  describe ".list" do
    let(:body) { fixture('page/collection.json') }
    let(:status) { 200 }
    let(:request_path) { 'page/' }

    before(:each) do
      stub_get(request_path).to_return(:body => body, :status => status,
                                       :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should allow listing the objects" do
      @actionkit.page.list()
    end
  end


end