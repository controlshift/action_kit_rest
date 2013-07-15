module ActionKitRest

  # Defines HTTP verbs
  module Request
    extend ::Vertebrae::Request

    def post_json_request(path, params)
      p = {}
      p['data'] = params.to_json
      post_request(path, p)
    end

    def request(method, path, params, options) # :nodoc:
      if !::Vertebrae::Request::METHODS.include?(method)
        raise ArgumentError, "unkown http method: #{method}"
      end

      ::ActionKitRest.logger.debug "EXECUTED: #{method} - #{path} with #{params} and #{options}"

      conn = connection(options.merge(current_options))
      path =  conn.path_prefix + '/' + path

      response = conn.send(method) do |request|
        case method.to_sym
          when *(::Vertebrae::Request::METHODS - ::Vertebrae::Request::METHODS_WITH_BODIES)
            request.body = params.delete('data') if params.has_key?('data')
            request.url(path, params)
          when *::Vertebrae::Request::METHODS_WITH_BODIES
            request.path = path
            request.body = extract_data_from_params(params) unless params.empty?
        end
      end
      ActionKitRest::Response::Wrapper.new(response)
    end

    private

    def extract_data_from_params(params) # :nodoc:
      if params.has_key?('data') && params['data'].present?
        return params['data']
      else
        return params
      end
    end
  end
end