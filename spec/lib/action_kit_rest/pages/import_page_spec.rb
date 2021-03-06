# frozen_string_literal: true

require 'spec_helper'
require 'support/shared_contexts/stub_logger'

describe ActionKitRest::Pages::ImportPage do
  include_context 'stub_logger'

  let(:actionkit) { ActionKitRest.new(host: 'test.com') }
  let(:status) { 200 }

  describe 'create' do
    let(:body) { '' }
    let(:request_body) { { title: 'Title', name: 'name' }.to_json }
    let(:request_path) { 'importpage/' }

    before(:each) do
      stub_post(request_path).with(body: request_body).to_return(body: body, status: status,
                                                                 headers: { location: 'https://test.com/rest/v1/importpage/1093/', content_type: 'application/json; charset=utf-8' })

      stub_request(:get, 'https://test.com/rest/v1/importpage/1093/').to_return(body: fixture('page/object.json'),
                                                                                status: '200', headers: { content_type: 'application/json; charset=utf-8' })
    end

    describe '.create' do
      it 'should allow creation' do
        resp = actionkit.import_page.create(title: 'Title', name: 'name')
        expect(resp.title).to eq 'Demand a Sustainable USDA'
      end
    end
  end

  describe 'update' do
    let(:body) { '' }
    let(:request_body) { { title: 'Title', name: 'name' }.to_json }
    let(:request_path) { 'importpage/1093/' }

    before(:each) do
      stub_put(request_path).with(body: request_body).to_return(body: body, status: status,
                                                                headers: { content_type: 'application/json; charset=utf-8' })

      stub_request(:get, 'https://test.com/rest/v1/importpage/1093/').to_return(body: fixture('page/object.json'),
                                                                                status: '200', headers: { content_type: 'application/json; charset=utf-8' })
    end

    describe '.update' do
      it 'should allow updates' do
        resp = actionkit.import_page.update('1093', title: 'Title', name: 'name')
        expect(resp.title).to eq 'Demand a Sustainable USDA'
      end
    end
  end
end
