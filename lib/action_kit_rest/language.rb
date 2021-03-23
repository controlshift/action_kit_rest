# frozen_string_literal: true

module ActionKitRest
  class Language < Base
    def base_path
      'language'
    end

    def find(iso_code)
      response = list(iso_code: iso_code)
      response.obj.first
    end
  end
end
