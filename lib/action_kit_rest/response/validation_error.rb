module ActionKitRest
  module Response
    class ValidationError < StandardError
      attr_accessor :errors, :url, :body

      def initialize(params)
        self.url = params[:url]
        self.body = params[:body]
        self.errors = JSON.parse(params[:body])['errors']
        super()
      end

      def inspect
        puts "url: #{url}"
        puts "body: #{body}"
        puts "errors: #{errors}"
        super()
      end
      
    end
  end
end