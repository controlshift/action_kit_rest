module ActionKitRest
  class Railties < ::Rails::Railtie
    initializer 'Rails logger' do
      ActionKitRest.logger = Rails.logger
    end
  end
end