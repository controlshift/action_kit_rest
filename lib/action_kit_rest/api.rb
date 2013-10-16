module ActionKitRest
  class API < Vertebrae::API

    def request_with_wrapper( *args )
      ActionKitRest::Response::Wrapper.new( request_without_wrapper( *args ) )
    end
    alias_method_chain :request, :wrapper

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
      if params.has_key?('data') && params['data'].present?
        return params['data']
      else
        return params
      end
    end

    def default_options
      {
        user_agent: 'ActionKitRestGem',
        prefix: '/rest/v1/',
        content_type: 'application/json; charset=utf-8'
      }
    end

    def setup
      connection.stack do |builder|
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        builder.use Vertebrae::Request::BasicAuth, connection.configuration.authentication if connection.configuration.authenticated?

        builder.use Faraday::Response::Logger if ENV['DEBUG']

        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson

        builder.use  ActionKitRest::Response::RaiseError

        builder.adapter :em_synchrony
      end
    end
  end
end