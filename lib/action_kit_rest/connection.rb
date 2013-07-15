require 'faraday'
require 'faraday_middleware'
require 'action_kit_rest/response/raise_error'

module ActionKitRest
  module Connection

    extend self
    extend Vertebrae::Connection

    # Default middleware stack that uses default adapter as specified at
    # configuration stage.
    #
    def default_middleware(options={})
      Proc.new do |builder|
        builder.use Faraday::Request::Multipart
        builder.use Faraday::Request::UrlEncoded
        builder.use Vertebrae::Request::BasicAuth, authentication if authenticated?

        builder.use Faraday::Response::Logger if ENV['DEBUG']
        unless options[:raw]
          builder.use FaradayMiddleware::Mashify
          builder.use FaradayMiddleware::ParseJson
        end
        builder.use ActionKitRest::Response::RaiseError
        builder.adapter adapter
      end
    end

  end
end