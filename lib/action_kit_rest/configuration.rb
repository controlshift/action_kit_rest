module ActionKitRest
  module Configuration

    VALID_OPTIONS_KEYS = [
        :adapter,
        :endpoint,
        :ssl,
        :mime_type,
        :user_agent,
        :host,
        :username,
        :password,
        :connection_options,
    ].freeze

    # Other adapters are :typhoeus, :patron, :em_synchrony, :excon, :test
    DEFAULT_ADAPTER = :net_http

    # The default SSL configuration
    DEFAULT_SSL = {}

    # By default the <tt>Accept</tt> header will make a request for <tt>JSON</tt>
    DEFAULT_MIME_TYPE = :json

    # The value sent in the http header for 'User-Agent' if none is set
    DEFAULT_USER_AGENT = "ActionKit REST Gem #{ActionKitRest::VERSION::STRING}".freeze

    # by default do not set a host. this is specific to AK instance
    DEFAULT_HOST = nil

    # The api endpoint used to connect to AK if none is set
    DEFAULT_ENDPOINT = '/rest/v1/'.freeze

    # By default, don't set a user ame
    DEFAULT_USERNAME = nil

    # By default, don't set a user password
    DEFAULT_PASSWORD = nil

    # By default uses the Faraday connection options if none is set
    DEFAULT_CONNECTION_OPTIONS = {}


    attr_accessor *VALID_OPTIONS_KEYS

    # Convenience method to allow for global setting of configuration options
    def configure
      yield self
    end

    def self.extended(base)
      base.reset!
    end

    class << self
      def keys
        VALID_OPTIONS_KEYS
      end
    end

    def options
      options = {}
      VALID_OPTIONS_KEYS.each { |k| options[k] = send(k) }
      options
    end

    # Reset configuration options to their defaults
    #
    def reset!
      self.adapter            = DEFAULT_ADAPTER
      self.endpoint           = DEFAULT_ENDPOINT
      self.ssl                = DEFAULT_SSL
      self.mime_type          = DEFAULT_MIME_TYPE
      self.user_agent         = DEFAULT_USER_AGENT
      self.host               = DEFAULT_HOST
      self.username           = DEFAULT_USERNAME
      self.password           = DEFAULT_PASSWORD
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self
    end
  end # Configuration
end