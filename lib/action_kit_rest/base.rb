module ActionKitRest
  class Base < API
    def list
      get_request(normalized_base_path)
    end

    def get(id)
      get_request("#{normalized_base_path}#{id}/")
    end

    def create(params)
      resp = post_json_request(normalized_base_path, params)
      id = extract_id_from_response(resp)
      get(id)
    end

    def normalized_base_path
      "#{base_path}/"
    end

  end
end