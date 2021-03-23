# frozen_string_literal: true

module ActionKitRest
  module Pages
    class Base < ActionKitRest::Base
      # allows finding by name
      def find(name)
        response = list(name: name)
        response.obj.first
      end

      def find_or_create(params)
        page = find(params[:name])
        page = create(params) if page.blank?
        page
      end
    end
  end
end
