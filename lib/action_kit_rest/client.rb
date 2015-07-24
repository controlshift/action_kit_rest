require 'action_kit_rest/api'

module ActionKitRest
  class Client < API

    def page
      @page ||= ActionKitRest::Page.new(client: self)
    end

    def import_page
      @import_page ||= ActionKitRest::Pages::ImportPage.new(client: self)
    end

    def signup_page
      @signup_page ||= ActionKitRest::Pages::SignupPage.new(client: self)
    end
    
    def donation_page
      @donation_page ||= ActionKitRest::Pages::DonationPage.new(client: self)
    end

    def unsubscribe_page
      @unsubscribe_page ||= ActionKitRest::Pages::UnsubscribePage.new(client: self)
    end
      
    def action
      @action ||= ActionKitRest::Action.new(client: self)
    end

    def unsubscribe_action
      @unsubscribe_action ||= ActionKitRest::Actions::UnsubscribeAction.new(client: self)
    end

    def tag
      @tag ||= ActionKitRest::Tag.new(client: self)
    end
    
    def list
      @list ||= ActionKitRest::List.new(client: self)
    end
    
    def user
      @user ||= ActionKitRest::User.new(client: self)
    end

    def event
      @event ||= ActionKitRest::Event.new(client: self)
    end

  end
end