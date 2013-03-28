module ActionKitRest
  class Action < API
    def create
      post_json_request("action/", params)
    end

  end
end