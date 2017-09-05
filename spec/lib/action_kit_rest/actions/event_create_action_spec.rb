require 'spec_helper'

describe ActionKitRest::Actions::EventCreateAction do
  describe '#get' do
    let(:actionkit) { ActionKitRest.new(host: 'test.com')  }

    before :each do
      stub_request(:get, "https://test.com/rest/v1/eventcreateaction/123/")
        .to_return(body: fixture('action/event_create_action.json'), status: '200', headers: {content_type: "application/json; charset=utf-8"})
    end

    it 'should retrieve eventcreateaction and aggregate parsed event and user IDs' do
      ak_event_create_action = actionkit.event_create_action.get('123')

      expect(ak_event_create_action.id).to eq(12345)
      expect(ak_event_create_action.event_id).to eq('999')
      expect(ak_event_create_action.user_id).to eq('112233')
    end
  end
end
