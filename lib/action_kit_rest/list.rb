module ActionKitRest
  class List < Base
    def list
      get_request("list/")
    end

    def get(id)
      get_request("list/#{id}/")
    end
    
    def find(name)
      response = list(name: name)
      response.obj.first
    end
  end
end