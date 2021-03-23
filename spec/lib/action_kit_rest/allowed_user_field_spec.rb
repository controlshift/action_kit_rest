# frozen_string_literal: true

require 'spec_helper'

describe ActionKitRest::AllowedUserField do
  let(:status) { 200 }
  let(:standard_headers) { { content_type: 'application/json; charset=utf-8' } }

  subject { ActionKitRest.new(host: 'test.com', username: 'alice', password: 'somesecret') }

  before(:each) do
    logger = double
    logger.stub(:debug).and_return(true)

    ActionKitRest.stub(:logger).and_return(logger)
    Vertebrae::Base.stub(:logger).and_return(logger)
  end

  describe '#list' do
    let(:request_path) { 'alloweduserfield/' }
    let(:response_body) { fixture('allowed_user_field/list.json') }

    before :each do
      stub_get(request_path).with(basic_auth: %w[alice somesecret])
                            .to_return(body: response_body,
                                       status: status,
                                       headers: standard_headers)
    end

    it 'should return a list of objects' do
      fields = subject.allowed_user_field.list
      fields.each do |field|
        expect(field).to respond_to(:name)
      end
    end
  end

  describe '#find' do
    let(:request_path) { 'alloweduserfield/?name=age' }
    let(:response_body) { fixture('allowed_user_field/list_filtered.json') }

    before :each do
      stub_get(request_path).with(basic_auth: %w[alice somesecret])
                            .to_return(body: response_body,
                                       status: status,
                                       headers: standard_headers)
    end

    it 'should return a single object' do
      field = subject.allowed_user_field.find('age')
      expect(field.field_type).to eq 'integer'
    end
  end

  describe '#create' do
    let(:create_request_path) { 'alloweduserfield/' }
    let(:create_request_body) { { name: 'foo' }.to_json }
    let(:create_status) { 201 }
    let(:created_url) { 'https://test.com/rest/v1/alloweduserfield/foo/' }
    let(:get_request_path) { 'alloweduserfield/foo/' }
    let(:get_response_body) { fixture('allowed_user_field/get.json') }

    before :each do
      stub_post(create_request_path).with(basic_auth: %w[alice somesecret],
                                          body: create_request_body)
                                    .to_return(status: create_status,
                                               headers: standard_headers.merge(Location: created_url))

      stub_get(get_request_path).with(basic_auth: %w[alice somesecret])
                                .to_return(body: get_response_body,
                                           status: status,
                                           headers: standard_headers)
    end

    it 'should POST to the endpoint, then do a GET on the created object' do
      field = subject.allowed_user_field.create({ name: 'foo' })
      expect(field.display_name).to eq 'Foo'
    end
  end
end
