module ActionKitRest
  module Configuration
    def self.included(mod)
      Vertebrae::Base.configure do |config|
        config.prefix = '/rest/v1/'
      end
    end

  end
end