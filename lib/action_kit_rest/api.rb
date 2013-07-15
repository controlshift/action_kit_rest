require 'action_kit_rest/connection'

module ActionKitRest
  class API <  Vertebrae::API
    include Connection
    include Request

    private

    def extract_id_from_response(resp)
      extract_id_from_location(resp.response.headers["location"])
    end

    def extract_id_from_location(location)
      location.scan(/\/(\d+)\/$/).first.first
    end

  end
end