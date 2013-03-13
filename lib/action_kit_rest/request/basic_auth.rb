module ActionKitRest
  module Request
    class BasicAuth < Faraday::Middleware
      dependency 'base64'

      def call(env)
        env[:request_headers].merge!('Authorization' => "Basic #{@auth}\"")

        @app.call env
      end

      def initialize(app, *args)
        @app = app
        credentials = ""
        options = args.extract_options!
        if options.has_key? :username
          credentials = "#{options[:username]}:#{options[:password]}"
        elsif options.has_key? :basic_auth
          credentials = "#{options[:basic_auth]}"
        end
        @auth = Base64.encode64(credentials)
        @auth.gsub!("\n", "")
      end
    end # BasicAuth
  end
end