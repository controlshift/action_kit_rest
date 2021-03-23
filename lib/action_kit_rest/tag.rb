# frozen_string_literal: true

module ActionKitRest
  class Tag < Base
    def base_path
      'tag'
    end

    def find(name)
      response = list(name: name)
      response.obj.first
    end

    def find_or_create(name)
      tag = find(name)
      tag = create(name: name) if tag.blank?
      tag
    end
  end
end
