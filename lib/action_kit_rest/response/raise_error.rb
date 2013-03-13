module ActionKitRest
  class Response::RaiseError < Faraday::Response::Middleware

    def on_complete(response)
      status_code = response[:status].to_i
      raise Exception.new(error_message(response)) if (400...600).include? status_code
    end

    def error_message(response)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:response_headers]['status']}#{(': ' + response[:body]['error']) if response[:body] && response[:body]['error']}"
    end

  end # Response::RaiseError
end