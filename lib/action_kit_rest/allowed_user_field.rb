module ActionKitRest
  class AllowedUserField < Base
    def base_path
      'alloweduserfield'
    end

    def find(name)
      response = list(name: name)
      response.obj.first
    end

    private

    # We must override this, because the paths for allowed user fields use the name,
    # not a numerical ID.
    def extract_id_from_response(resp)
      resp.response.headers["location"].split('/').last
    end
  end
end
