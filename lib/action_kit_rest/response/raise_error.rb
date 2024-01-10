# frozen_string_literal: true

module ActionKitRest
  module Response
    class RaiseError < Faraday::Response::Middleware
      def on_complete(response)
        status_code = response[:status].to_i
        if (400...600).include? status_code
          if status_code == 400
            response_body = response[:body]
            if ActionKitRest::Response::InvalidAkidError.matches?(JSON.parse(response_body)['errors'])
              raise ActionKitRest::Response::InvalidAkidError.new(url: response[:url].to_s, body: response_body)
            else
              raise ActionKitRest::Response::ValidationError.new(url: response[:url].to_s, body: response_body)
            end
          elsif status_code == 404
            raise ActionKitRest::Response::NotFound, response[:url].to_s
          elsif status_code == 401
            raise ActionKitRest::Response::Unauthorized, response[:url].to_s
          elsif status_code == 500 && response[:body] =~ /"error"/
            error_hsh = JSON.parse(response[:body])
            error_message = error_hsh['error']

            if error_message == 'Sorry, this request could not be processed. Please try again later.'
              raise ActionKitRest::Response::TryAgainLater, error_message(response)
            else
              raise ActionKitRest::Response::UnknownServerError, error_message(response)
            end
          else
            raise ActionKitRest::Response::UnknownServerError, error_message(response)
          end
        end
      end

      def error_message(response)
        "#{response[:method].to_s.upcase} #{response[:url]}: #{response[:status]} \n\n #{response[:body]}"
      end
    end

    class UnknownServerError < StandardError; end

    class TryAgainLater < StandardError; end

    class NotFound < StandardError; end

    class Unauthorized < StandardError; end
  end
end
