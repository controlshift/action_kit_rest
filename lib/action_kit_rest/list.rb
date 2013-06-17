module ActionKitRest
  class List < Base
    def base_path
      'list'
    end

    def find(name)
      response = list(name: name)
      response.obj.first
    end
  end
end