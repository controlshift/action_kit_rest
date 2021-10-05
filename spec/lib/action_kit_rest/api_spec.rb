# frozen_string_literal: true

require 'spec_helper'
require 'support/shared_contexts/stub_logger'

describe ActionKitRest::API do
  include_context 'stub_logger'

  subject { ActionKitRest::API.new(host: 'example.com', username: 'foo', password: 'bar') }

  describe 'error detection' do
    let(:request_body) { {some: 'data'} }

    before :each do
      stub_request(:post, 'https://example.com/rest/v1/something/')
        .to_return(status: response_status, body: response_body,
                   headers: { content_type: 'application/json; charset=utf-8' })
    end

    context 'successful response' do
      let(:response_status) { 200 }
      let(:response_body) { '{"message": "good job!"}' }

      it 'should not raise' do
        subject.post_request('something/', request_body)
      end
    end

    context '400 response' do
      let(:response_status) { 400 }

      context 'unable to associate mailing ID' do
        let(:response_body) { '{"errors": {"mailing_id": ["Unable to associate this mailing ID with account."]}}' }

        it 'should raise an InvalidAkidError' do
          expect{ subject.post_request('something/', request_body) }.to raise_error(ActionKitRest::Response::InvalidAkidError)
        end
      end

      context 'unable to associate mailing ID error in Hebrew' do
        let(:response_body) { '{"errors": {"mailing_id": ["לא הצלחנו לקשר בין מספר הזיהוי של רשימת הדיוור הזו לבין החשבון."]}}' }

        it 'should raise an InvalidAkidError' do
          expect{ subject.post_request('something/', request_body) }.to raise_error(ActionKitRest::Response::InvalidAkidError)
        end
      end

      context 'other error' do
        let(:response_body) { '{"errors": {"zip": ["There is something wrong with your ZIP code!"]}}' }

        it 'sould raise a ValidationError' do
          expect{ subject.post_request('something/', request_body) }.to raise_error(ActionKitRest::Response::ValidationError)
        end
      end
    end

    context '401 response' do
      let(:response_status) { 401 }
      let(:response_body) { '{"error": "Your API key is no good"}' }

      it 'should raise an Unauthorized exception' do
        expect{ subject.post_request('something/', request_body) }.to raise_error(ActionKitRest::Response::Unauthorized)
      end
    end

    context '404 response' do
      let(:response_status) { 404 }
      let(:response_body) { '{"error": "not found"}' }

      it 'should raise a NotFound exception' do
        expect{ subject.post_request('something/', request_body) }.to raise_error(ActionKitRest::Response::NotFound)
      end
    end

    context '500 response' do
      let(:response_status) { 500 }

      context 'Try Again Later message' do
        let(:response_body) { '{"error": "Sorry, this request could not be processed. Please try again later."}' }

        it 'should raise a TryAgainLater exception' do
          expect{ subject.post_request('something/', request_body) }.to raise_error(ActionKitRest::Response::TryAgainLater)
        end
      end

      context 'other error message' do
        let(:response_body) { '{"error": "Something is wrong, we will fix it!"}' }

        it 'should raise a StandardError' do
          expect{ subject.post_request('something/', request_body) }.to raise_error(StandardError)
        end
      end
    end
  end
end
