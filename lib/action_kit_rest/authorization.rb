module ActionKitRest
  module Authorization

    # Check whether authentication credentials are present
    def authenticated?
      (username? && password?)
    end

    def basic_auth
      "#{username}:#{password}"
    end

  end # Authorization
end