module ActionKitRest
  module Constants
    extend self

    # Response headers
    RATELIMIT_REMAINING = 'X-RateLimit-Remaining'.freeze

    RATELIMIT_LIMIT = 'X-RateLimit-Limit'.freeze

    CONTENT_TYPE = 'Content-Type'.freeze

    CONTENT_LENGTH = 'content-length'.freeze

    CACHE_CONTROL = 'cache-control'.freeze

    ETAG = 'ETag'.freeze

    SERVER = 'Server'.freeze

    DATE = 'Date'.freeze

    LOCATION = 'Location'.freeze

    USER_AGENT = 'User-Agent'.freeze

    ACCEPT = 'Accept'.freeze

    ACCEPT_CHARSET = 'Accept-Charset'.freeze

  end # Constants
end