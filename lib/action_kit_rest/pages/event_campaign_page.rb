# frozen_string_literal: true

module ActionKitRest
  module Pages
    class EventCampaignPage < ActionKitRest::Pages::Base
      def base_path
        'campaign'
      end

      def create(params)
        event_pages_tags = params.delete(:event_pages_tags)
        event_campaign = super(params)

        # Also create EventCreatePage and EventSignupPage
        event_campaign.obj['event_create_page_name'] = create_event_create_page(event_campaign, event_pages_tags)
        event_campaign.obj['event_signup_page_name'] = create_event_signup_page(event_campaign, event_pages_tags)

        event_campaign
      end

      def find(name)
        event_campaign = super
        return unless event_campaign.present?

        # Aggregate EventCreatePage and EventSignupPage
        event_campaign['event_create_page_name'] = get_event_create_page(event_campaign)
        event_campaign['event_signup_page_name'] = get_event_signup_page(event_campaign)

        event_campaign
      end

      private

      def get_event_create_page(event_campaign)
        response = client.get_request('eventcreatepage/', name: "#{event_campaign.name}-event-create")
        response.obj.try(:first).try(:name)
      end

      def get_event_signup_page(event_campaign)
        response = client.get_request('eventsignuppage/', name: "#{event_campaign.name}-event-signup")
        response.obj.try(:first).try(:name)
      end

      def create_event_create_page(event_campaign, tags)
        params = event_create_page_params(event_campaign, tags)
        _response = client.post_json_request('eventcreatepage/', params)

        params[:name]
      end

      def event_create_page_params(event_campaign, tags)
        {
          campaign: event_campaign['resource_uri'],
          name: "#{event_campaign['name']}-event-create",
          title: "#{event_campaign['title']}: event create",
          tags: tags
        }
      end

      def create_event_signup_page(event_campaign, tags)
        params = event_signup_page_params(event_campaign, tags)
        _response = client.post_json_request('eventsignuppage/', params)

        params[:name]
      end

      def event_signup_page_params(event_campaign, tags)
        {
          campaign: event_campaign['resource_uri'],
          name: "#{event_campaign['name']}-event-signup",
          title: "#{event_campaign['title']}: event signup",
          tags: tags
        }
      end
    end
  end
end
