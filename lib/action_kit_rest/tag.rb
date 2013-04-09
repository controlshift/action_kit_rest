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
      if tag.blank?
        tag = create(name: name)
      end
      tag
    end
  end
end