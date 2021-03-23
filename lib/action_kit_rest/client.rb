# frozen_string_literal: true

require 'action_kit_rest/api'

module ActionKitRest
  class Client < API
    attr_accessor :clients

    def initialize(params)
      super(params)
      self.clients = {}
    end

    %i[import signup donation unsubscribe event_campaign].each do |page_type|
      define_method "#{page_type}_page" do
        clients["#{page_type}_page"] ||= ("ActionKitRest::Pages::#{page_type.to_s.classify}Page".constantize).new(client: self)
      end
    end

    %i[unsubscribe event_create event_signup].each do |action|
      define_method "#{action}_action" do
        clients["#{action}_action"] ||= ("ActionKitRest::Actions::#{action.to_s.classify}Action".constantize).new(client: self)
      end
    end

    %i[action page tag list user phone event language event_signup allowed_user_field].each do |thing|
      define_method thing do
        clients[thing] ||= ("ActionKitRest::#{thing.to_s.classify}".constantize).new(client: self)
      end
    end
  end
end
