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
        begin
          "#{super()} \n url: #{url} \n body: #{body} \n errors: #{errors}"
        rescue Encoding::CompatibilityError
          # Something went gravely wrong trying to construct the error message, so give up on the extra info
          # and just raise the name of the exception.
          # This will let us at least raise with a backtrace.
          super
        end
      end
    end

    class InvalidAkidError < ValidationError
    end
  end
end
