module ActionKitRest
  class Page < API
    def list
      get_request("page/")
    end

    def get(id)
      get_request("page/#{id}/")
    end

    def create(params)
      post_json_request("page/", params)
    end
  end
end