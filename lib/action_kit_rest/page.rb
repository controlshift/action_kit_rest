module ActionKitRest
  class Page < API
    def list()
      get_request("page/")
    end
  end
end