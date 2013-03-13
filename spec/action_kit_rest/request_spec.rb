require 'spec_helper'


describe ActionKitRest::Request do
  let(:ak) { ActionKitRest::API.new  }
  let(:path) { 'actionkit.api/rest/v1/action' }
  let(:params) { {} }
  let(:options) { {} }

  it "knows how to make get request" do
    ak.should_receive(:request).with(:get, path, params, options)
    ak.get_request path, params, options
  end

  it "knows how to make patch request" do
    ak.should_receive(:request).with(:patch, path, params, options)
    ak.patch_request path, params, options
  end

  it "knows how to make post request" do
    ak.should_receive(:request).with(:post, path, params, options)
    ak.post_request path, params, options
  end

  it "knows how to make put request" do
    ak.should_receive(:request).with(:put, path, params, options)
    ak.put_request path, params, options
  end

  it "knows how to make delete request" do
    ak.should_receive(:request).with(:delete, path, params, options)
    ak.delete_request path, params, options
  end
end