# frozen_string_literal: true

module ActionKitRest
  module Response
    class ValidationError < StandardError
      attr_accessor :errors, :url, :body

      def initialize(params)
        self.url = params[:url]
        self.body = params[:body].dup
        self.errors = JSON.parse(params[:body])['errors']
        super()
      end

      def to_s
        "#{super()} \n url: #{url} \n body: #{body.force_encoding('UTF-8')} \n errors: #{errors}"
      rescue Encoding::CompatibilityError
        # Something went gravely wrong trying to construct the error message, so give up on the extra info
        # and just raise the name of the exception.
        # This will let us at least raise with a backtrace.
        super
      end
    end

    class InvalidAkidError < ValidationError
      MATCHING_ERRORS = ['Unable to associate this mailing ID with account.',
                         'לא הצלחנו לקשר בין מספר הזיהוי של רשימת הדיוור הזו לבין החשבון.'].freeze

      def self.matches?(errors)
        return false unless errors&.keys == ['mailing_id']

        mailing_id_errors = errors['mailing_id']
        return false unless mailing_id_errors.size == 1

        MATCHING_ERRORS.include?(mailing_id_errors.first)
      end
    end
  end
end
