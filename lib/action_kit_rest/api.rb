# frozen_string_literal: true

module ActionKitRest
  class API < Vertebrae::API
    def request(*args)
      ActionKitRest::Response::Wrapper.new(super(*args))
    end

    def post_json_request(path, params)
      p = {}
      p['data'] = params.to_json
      post_request(path, p)
    end

    def put_json_request(path, params)
      p = {}
      p['data'] = params.to_json
      put_request(path, p)
    end

    def extract_data_from_params(params) # :nodoc:
      if params.key?('data') && params['data'].present?
        params['data']
      else
        params
      end
    end

    def default_options
      {
        user_agent: 'ActionKitRestGem',
        prefix: '/rest/v1',
        content_type: 'application/json; charset=utf-8'
      }
    end

    def setup
      # Override the faraday connection to use ActionKitRest's custom error handler
      connection.faraday_connection = Faraday.new(connection.configuration.faraday_options) do |f|
        if connection.configuration.authenticated?
          f.request :authorization, :basic, connection.configuration.username, connection.configuration.password
        end
        f.request :multipart
        f.request :url_encoded

        f.response :logger if ENV['DEBUG']

        unless initialisation_options[:raw]
          f.response :mashify
          f.response :json
        end

        f.use ActionKitRest::Response::RaiseError
        
        # Handle adapter registration - some adapters need to be required separately in Faraday 2.x
        adapter_name = connection.configuration.adapter
        begin
          f.adapter adapter_name
        rescue Faraday::Error => e
          # Fall back to default adapter if the requested one isn't available
          warn "Adapter #{adapter_name} not available (#{e.message}), falling back to default"
          f.adapter Faraday.default_adapter
        end
      end
    end
  end
end
