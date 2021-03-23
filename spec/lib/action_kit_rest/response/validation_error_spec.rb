# frozen_string_literal: true

require 'spec_helper'

describe ActionKitRest::Response::ValidationError do
  describe '#to_s' do
    subject { ActionKitRest::Response::ValidationError.new(url: url, body: body) }

    context 'with a normal URL and body' do
      let(:url) { 'https://actionkit.example.com/rest/v1/page/1' }
      let(:errors) { { 'zip' => 'invalid zip code' } }
      let(:body) { { errors: errors }.to_json }

      it 'should put information in the string' do
        expect(subject.to_s).to eq "ActionKitRest::Response::ValidationError \n url: #{url} \n body: #{body} \n errors: #{errors.inspect}"
      end
    end

    context 'with special characters in the body' do
      let(:url) { 'https://actionkit.example.com/rest/v1/page/1' }
      let(:errors) { { 'zip' => '☃' } }
      let(:body) { { errors: errors }.to_json }

      it 'should put information in the string' do
        expect(subject.to_s).to eq "ActionKitRest::Response::ValidationError \n url: #{url} \n body: #{body} \n errors: #{errors.inspect}"
      end
    end
  end
end
