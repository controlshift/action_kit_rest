module ActionKitRest
  module Response
    class ValidationError < StandardError
      attr_accessor :errors
      attr_accessor :url
      
      def initialize(params)
        self.url = params[:url]
        self.errors = JSON.parse(params[:body])['errors']
        super()
      end
      
    end
  end
end