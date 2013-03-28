require 'action_kit_rest/api'

module ActionKitRest
  class Client < API

    def page(options={}, &block)
      @page ||= ActionKitRest::Page.new(current_options.merge(options), &block)
    end

    def import_page(options={}, &block)
      @import_page ||= ActionKitRest::Pages::ImportPage.new(current_options.merge(options), &block)
    end

    def signup_page(options={}, &block)
      @signup_page ||= ActionKitRest::Pages::SignupPage.new(current_options.merge(options), &block)
    end

    def action(options={}, &block)
      @action ||= ActionKitRest::Action.new(current_options.merge(options), &block)
    end

    def tag(options={}, &block)
      @tag ||= ActionKitRest::Tag.new(current_options.merge(options), &block)
    end
  end
end