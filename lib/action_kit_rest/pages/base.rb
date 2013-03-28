module ActionKitRest
  module Pages
    class Base < API
      def list
        get_request(base_path)
      end

      def get(id)
        get_request("#{base_path}#{id}/")
      end

      def create(params)
        resp = post_json_request(base_path, params)
        id = extract_id_from_response(resp)
        get(id)
      end

      private

    end
  end
end