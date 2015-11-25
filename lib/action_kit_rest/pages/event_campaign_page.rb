module ActionKitRest
  module Pages
    class EventCampaignPage < ActionKitRest::Pages::Base
      def base_path
        'campaign'
      end

      def create(params)
        event_campaign = super(params)

        # Also create EventCreatePage and EventSignupPage
        client.post_json_request('eventcreatepage/', event_create_page_params(event_campaign))
        client.post_json_request('eventsignuppage/', event_signup_page_params(event_campaign))

        event_campaign
      end

      private

      def event_create_page_params(event_campaign)
        {
          campaign: event_campaign['resource_uri'],
          name: "#{event_campaign['name']}-event-create"
        }
      end

      def event_signup_page_params(event_campaign)
        {
          campaign: event_campaign['resource_uri'],
          name: "#{event_campaign['name']}-event-signup"
        }
      end
    end
  end
end
