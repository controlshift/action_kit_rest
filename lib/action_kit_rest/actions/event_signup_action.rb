# frozen_string_literal: true

module ActionKitRest
  module Actions
    class EventSignupAction < Action
      def base_path
        'eventsignupaction'
      end

      def get(id)
        ak_event_signup_action = super

        # Aggregate fields parsed from referrenced entities' URI
        ak_event_signup_action.obj['event_signup_id'] =
          ak_event_signup_action.signup.match(%r{/rest/v1/eventsignup/(\d*)/})[1]
        ak_event_signup_action.obj['user_id'] = ak_event_signup_action.user.match(%r{/rest/v1/user/(\d*)/})[1]

        ak_event_signup_action
      end
    end
  end
end
