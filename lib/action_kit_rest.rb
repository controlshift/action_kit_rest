require 'vertebrae'

module ActionKitRest
  extend Vertebrae::Base

  class << self
    def new(options = {})
      ActionKitRest::Client.new(options)
    end
  end
end

require 'action_kit_rest/version'
require 'action_kit_rest/client'
require 'action_kit_rest/page'
require 'action_kit_rest/base'
require 'action_kit_rest/list'
require 'action_kit_rest/action'
require 'action_kit_rest/user'
require 'action_kit_rest/tag'
require 'action_kit_rest/pages/base'
require 'action_kit_rest/pages/import_page'
require 'action_kit_rest/pages/signup_page'
require 'action_kit_rest/response/wrapper'
require 'action_kit_rest/response/raise_error'
require 'action_kit_rest/response/validation_error'
require 'action_kit_rest/response/collection'
require 'active_support/all'

require 'action_kit_rest/railties' if defined? Rails
