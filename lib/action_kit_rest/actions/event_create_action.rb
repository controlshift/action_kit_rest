# frozen_string_literal: true

module ActionKitRest
  module Actions
    class EventCreateAction < Action
      def base_path
        'eventcreateaction'
      end

      def get(id)
        ak_event_create_action = super

        # Aggregate fields parsed from referrenced entities' URI
        ak_event_create_action.obj['event_id'] = ak_event_create_action.event.match(%r{/rest/v1/event/(\d*)/})[1]
        ak_event_create_action.obj['user_id'] = ak_event_create_action.user.match(%r{/rest/v1/user/(\d*)/})[1]

        ak_event_create_action
      end
    end
  end
end
