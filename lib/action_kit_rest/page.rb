# frozen_string_literal: true

module ActionKitRest
  class Page < Vertebrae::Model
    def list
      client.get_request('page/')
    end

    def get(id)
      client.get_request("page/#{id}/")
    end
  end
end
