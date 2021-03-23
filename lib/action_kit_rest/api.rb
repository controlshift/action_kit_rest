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
      connection.stack do |builder|
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        if connection.configuration.authenticated?
          builder.use Faraday::Request::BasicAuthentication, connection.configuration.username,
                      connection.configuration.password
        end

        builder.use Faraday::Response::Logger if ENV['DEBUG']

        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson

        builder.use ActionKitRest::Response::RaiseError
        builder.adapter connection.configuration.adapter
      end
    end
  end
end
