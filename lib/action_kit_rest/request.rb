module ActionKitRest

  # Defines HTTP verbs
  module Request

    METHODS = [:get, :post, :put, :delete, :patch]
    METHODS_WITH_BODIES = [ :post, :put, :patch ]

    def get_request(path, params={}, options={})
      request(:get, path, params, options)
    end

    def patch_request(path, params={}, options={})
      request(:patch, path, params, options)
    end

    def post_request(path, params={}, options={})
      request(:post, path, params, options)
    end

    def put_request(path, params={}, options={})
      request(:put, path, params, options)
    end

    def delete_request(path, params={}, options={})
      request(:delete, path, params, options)
    end

    def post_json_request(path, params)
      p = {}
      p['data'] = params.to_json
      post_request(path, p)
    end

    def request(method, path, params, options) # :nodoc:
      if !METHODS.include?(method)
        raise ArgumentError, "unkown http method: #{method}"
      end

      ActionKitRest.logger.debug "EXECUTED: #{method} - #{path} with #{params} and #{options}"

      conn = connection(options.merge(current_options))
      path =  conn.path_prefix + '/' + path

      response = conn.send(method) do |request|
        case method.to_sym
          when *(METHODS - METHODS_WITH_BODIES)
            request.body = params.delete('data') if params.has_key?('data')
            request.url(path, params)
          when *METHODS_WITH_BODIES
            request.path = path
            request.body = extract_data_from_params(params) unless params.empty?
        end
      end
      ActionKitRest::Response::Wrapper.new(response)
      #ResponseWrapper.new(response, self).auto_paginate
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