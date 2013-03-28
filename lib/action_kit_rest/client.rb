require 'action_kit_rest/api'

module ActionKitRest
  class Client < API

    def page(options={}, &block)
      @page ||= Page.new(current_options.merge(options), &block)
    end

    def import_page(options={}, &block)
      @page ||= Pages::ImportPage.new(current_options.merge(options), &block)
    end

    def signup_page(options={}, &block)
      @page ||= Pages::SignupPage.new(current_options.merge(options), &block)
    end

    def action(options={}, &block)
      @page ||= Action.new(current_options.merge(options), &block)
    end
  end
end