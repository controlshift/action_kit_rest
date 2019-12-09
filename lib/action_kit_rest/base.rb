module ActionKitRest
  class Base < Vertebrae::Model

    def list(filters = {})
      client.get_request(normalized_base_path, filters)
    end

    def get(id)
      client.get_request("#{normalized_base_path}#{url_escape(id)}/")
    end

    def create(params)
      cleaned_params = clean_params(params)
      resp = client.post_json_request(normalized_base_path, cleaned_params)
      id = extract_id_from_response(resp)
      get(id)
    end

    def update(id, params)
      cleaned_params = clean_params(params)
      client.put_json_request("#{normalized_base_path}#{url_escape(id)}/", cleaned_params)
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
      extract_id_from_location(resp.response.headers["location"])
    end

    def extract_id_from_location(location)
      location.scan(/\/(\d+)\/$/).first.first
    end

    def strip_unsupported_characters(string)
      string.each_char.select{|c| c.bytes.count <= 3 }.join('')
    end

    # ActionKit only supports three-byte UTF-8 for many fields.
    def clean_params(params)
      cleaned_params = {}
      params.each do |k, v|
        if v.is_a? String
          cleaned_params[k] = strip_unsupported_characters(v)
        end
      end
      cleaned_params
    end
  end
end
