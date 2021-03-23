# frozen_string_literal: true

module ActionKitRest
  class Base < Vertebrae::Model
    def list(filters = {})
      client.get_request(normalized_base_path, filters)
    end

    def get(id)
      client.get_request("#{normalized_base_path}#{url_escape(id)}/")
    end

    def create(params)
      resp = client.post_json_request(normalized_base_path, params)
      id = extract_id_from_response(resp)
      get(id)
    end

    def update(id, params)
      client.put_json_request("#{normalized_base_path}#{url_escape(id)}/", params)
      get(id)
    end

    def normalized_base_path
      "#{base_path}/"
    end

    private

    def url_escape(string)
      CGI.escape(string.to_s)
    end

    def extract_id_from_response(resp)
      extract_id_from_location(resp.response.headers['location'])
    end

    def extract_id_from_location(location)
      location.scan(%r{/(\d+)/$}).first.first
    end
  end
end
