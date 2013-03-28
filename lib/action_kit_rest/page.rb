module ActionKitRest
  class Page < API
    def list
      get_request("page/")
    end

    def get(id)
      get_request("page/#{id}/")
    end
  end
end