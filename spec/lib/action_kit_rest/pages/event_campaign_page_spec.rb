# frozen_string_literal: true

require 'spec_helper'
require 'support/shared_contexts/stub_logger'

describe ActionKitRest::Pages::EventCampaignPage do
  include_context 'stub_logger'

  describe 'create' do
    let(:actionkit) { ActionKitRest.new(host: 'test.com') }

    let(:event_campaign_title) { 'Climate Change Paris 2015' }
    let(:event_campaign_name) { 'climate-change-paris-2015' }

    before :each do
      stub_request(:post, 'https://test.com/rest/v1/campaign/')
        .with(body: "{\"title\":\"#{event_campaign_title}\",\"name\":\"#{event_campaign_name}\"}")
        .to_return({ status: '200', headers: { location: 'https://test.com/rest/v1/campaign/88/' } })

      stub_request(:get, 'https://test.com/rest/v1/campaign/88/')
        .to_return({ body: fixture('page/campaign.json'), status: '200',
                     headers: { content_type: 'application/json; charset=utf-8' } })

      stub_request(:post, 'https://test.com/rest/v1/eventcreatepage/')
        .with(body: '{"campaign":"/rest/v1/campaign/88/","name":"climate-change-paris-2015-event-create","title":"Climate Change Paris 2015: event create","tags":["/rest/v1/tag/1/","/rest/v1/tag/5/"]}')
        .to_return({ status: '200', headers: { location: 'https://test.com/rest/v1/eventcreatepage/99/' } })

      stub_request(:post, 'https://test.com/rest/v1/eventsignuppage/')
        .with(body: '{"campaign":"/rest/v1/campaign/88/","name":"climate-change-paris-2015-event-signup","title":"Climate Change Paris 2015: event signup","tags":["/rest/v1/tag/1/","/rest/v1/tag/5/"]}')
        .to_return({ status: '200', headers: { location: 'https://test.com/rest/v1/eventsignuppage/111/' } })
    end

    it 'should create an event campaign' do
      resp = actionkit.event_campaign_page.create({ title: 'Climate Change Paris 2015',
                                                    name: 'climate-change-paris-2015', event_pages_tags: ['/rest/v1/tag/1/', '/rest/v1/tag/5/'] })
      expect(resp.title).to eq event_campaign_title
      expect(resp.name).to eq event_campaign_name

      expect(a_request(:post, 'https://test.com/rest/v1/campaign/')).to have_been_made
      expect(a_request(:get, 'https://test.com/rest/v1/campaign/88/')).to have_been_made
    end

    it 'should create associated event and signup create pages' do
      resp = actionkit.event_campaign_page.create({ title: 'Climate Change Paris 2015',
                                                    name: 'climate-change-paris-2015', event_pages_tags: ['/rest/v1/tag/1/', '/rest/v1/tag/5/'] })
      expect(resp.event_create_page_name).to eq 'climate-change-paris-2015-event-create'
      expect(resp.event_signup_page_name).to eq 'climate-change-paris-2015-event-signup'

      expect(a_request(:post, 'https://test.com/rest/v1/eventcreatepage/')).to have_been_made
      expect(a_request(:post, 'https://test.com/rest/v1/eventsignuppage/')).to have_been_made
    end
  end

  describe 'find' do
    let(:actionkit) { ActionKitRest.new(host: 'test.com') }

    let(:event_campaign_title) { 'Climate Change Paris 2015' }
    let(:event_campaign_name) { 'climate-change-paris-2015' }

    before :each do
      stub_request(:get, 'https://test.com/rest/v1/campaign/?name=climate-change-paris-2015')
        .to_return(body: fixture('page/find_campaign.json'), status: '200', headers: { content_type: 'application/json; charset=utf-8' })
      stub_request(:get, 'https://test.com/rest/v1/eventcreatepage/?name=climate-change-paris-2015-event-create')
        .to_return(body: fixture('page/find_event_create.json'), status: '200', headers: { content_type: 'application/json; charset=utf-8' })
      stub_request(:get, 'https://test.com/rest/v1/eventsignuppage/?name=climate-change-paris-2015-event-signup')
        .to_return(body: fixture('page/find_event_signup.json'), status: '200', headers: { content_type: 'application/json; charset=utf-8' })
    end

    it 'should retrieve event campaign by name' do
      resp = actionkit.event_campaign_page.find(event_campaign_name)

      expect(resp.name).to eq event_campaign_name
      expect(resp.event_create_page_name).to eq 'climate-change-paris-2015-event-create'
      expect(resp.event_signup_page_name).to eq 'climate-change-paris-2015-event-signup'
    end
  end
end
