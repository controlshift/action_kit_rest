# A class responsible for proxing to faraday response &
# or a pagination collection.
module ActionKitRest
  module Response
    class Collection
      include Enumerable

      attr_reader :meta
      attr_reader :objects


      def initialize(meta, objects)
        @meta = meta
        @objects = objects
      end

      def each(&block)
        # todo handle pagination somehow!
        objects.each do |o|
          block.call(o)
        end
      end
    end
  end
end
