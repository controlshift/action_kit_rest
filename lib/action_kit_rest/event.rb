# frozen_string_literal: true

module ActionKitRest
  class Event < Base
    def base_path
      'event'
    end

    def find(name)
      response = list(name: name)
      response.obj.first
    end
  end
end
