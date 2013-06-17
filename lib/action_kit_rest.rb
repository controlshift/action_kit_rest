require 'action_kit_rest/version'
require 'action_kit_rest/configuration'
require 'action_kit_rest/request'
require 'action_kit_rest/constants'
require 'action_kit_rest/authorization'
require 'action_kit_rest/client'
require 'action_kit_rest/page'
require 'action_kit_rest/base'
require 'action_kit_rest/list'
require 'action_kit_rest/action'
require 'action_kit_rest/tag'
require 'action_kit_rest/pages/base'
require 'action_kit_rest/pages/import_page'
require 'action_kit_rest/pages/signup_page'
require 'action_kit_rest/core_ext/array'
require 'action_kit_rest/response/wrapper'
require 'action_kit_rest/response/validation_error'
require 'action_kit_rest/response/collection'
require 'active_support/all'
require 'action_kit_rest/railties' if defined? Rails



module ActionKitRest
  extend Configuration

  class << self
    def logger
      @@logger ||= Logger.new(STDOUT)
    end

    def logger=(logger)
      @@logger = logger
    end

    # Alias for ActionKitRest::Client.new
    #
    def new(options = {}, &block)
      ActionKitRest::Client.new(options, &block)
    end

    # Delegate to ActionKitRest::Client
    #
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private = false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

  end
end