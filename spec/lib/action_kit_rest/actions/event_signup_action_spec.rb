# frozen_string_literal: true

require 'spec_helper'

describe ActionKitRest::Actions::EventSignupAction do
  describe '#get' do
    let(:actionkit) { ActionKitRest.new(host: 'test.com') }

    before :each do
      stub_request(:get, 'https://test.com/rest/v1/eventsignupaction/54321/')
        .to_return(body: fixture('action/event_signup_action.json'), status: '200', headers: { content_type: 'application/json; charset=utf-8' })
    end

    it 'should retrieve eventsignupaction and aggregate parsed event sign-up and user IDs' do
      ak_event_signup_action = actionkit.event_signup_action.get('54321')

      expect(ak_event_signup_action.id).to eq(54_321)
      expect(ak_event_signup_action.event_signup_id).to eq('888')
      expect(ak_event_signup_action.user_id).to eq('111')
    end
  end
end
