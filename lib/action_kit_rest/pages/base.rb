module ActionKitRest
  module Pages
    class Base < ActionKitRest::Base
      # allows finding by name
      def find(name)
        response = list(name: name)
        response.obj.first
      end
    end
  end
end

