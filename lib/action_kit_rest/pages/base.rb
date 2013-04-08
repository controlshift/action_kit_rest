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
        if page.blank?
          page = create(params)
        end
        page
      end
    end
  end
end

