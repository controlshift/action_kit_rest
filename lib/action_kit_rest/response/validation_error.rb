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

      def to_s
        "#{super()} \n url: #{url} \n body: #{body} \n errors: #{errors}"
      end
      
    end
  end
end