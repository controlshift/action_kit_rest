module ActionKitRest
  class AllowedUserField < Base
    def base_path
      'alloweduserfield'
    end

    def find(name)
      response = list(name: name)
      response.obj.first
    end
  end
end
