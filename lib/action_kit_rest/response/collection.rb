# frozen_string_literal: true

# A class responsible for proxing to faraday response &
# or a pagination collection.
module ActionKitRest
  module Response
    class Collection
      include Enumerable

      attr_reader :meta, :objects

      def initialize(meta, objects)
        @meta = meta
        @objects = objects
      end

      def each(&block)
        # TODO: handle pagination somehow!
        objects.each do |o|
          block.call(o)
        end
      end
    end
  end
end
