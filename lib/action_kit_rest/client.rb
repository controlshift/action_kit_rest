require 'action_kit_rest/api'

module ActionKitRest
  class Client < API

    def page(options={}, &block)
      @page ||= Page.new(current_options.merge(options), &block)
    end
  end
end