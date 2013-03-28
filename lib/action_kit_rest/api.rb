require 'action_kit_rest/connection'

module ActionKitRest
  class API

    include Connection
    include Request
    include Authorization


    attr_reader *Configuration.keys


    attr_accessor :current_options

    # Callback to update current configuration options
    class_eval do
      Configuration.keys.each do |key|
        define_method "#{key}=" do |arg|
          self.instance_variable_set("@#{key}", arg)
          self.current_options.merge!({:"#{key}" => arg})
        end
      end
    end

    # Create new API
    #
    def initialize(options={}, &block)
      setup(options)
      yield_or_eval(&block) if block_given?
    end


    def yield_or_eval(&block)
      return unless block
      block.arity > 0 ? yield(self) : self.instance_eval(&block)
    end

    # Configure options and process basic authorization
    #
    def setup(options={})
      options = ActionKitRest.options.merge(options)
      self.current_options = options
      Configuration.keys.each do |key|
        send("#{key}=", options[key])
      end
      process_basic_auth(options[:basic_auth])
    end

    # Extract login and password from basic_auth parameter
    #
    def process_basic_auth(auth)
      case auth
        when String
          self.username, self.password = auth.split(':', 2)
        when Hash
          self.username = auth[:username]
          self.password = auth[:password]
      end
    end

    # Responds to attribute query or attribute clear
    def method_missing(method, *args, &block) # :nodoc:
      case method.to_s
        when /^(.*)\?$/
          return !!self.send($1.to_s)
        when /^clear_(.*)$/
          self.send("#{$1.to_s}=", nil)
        else
          super
      end
    end

    # Acts as setter and getter for api requests arguments parsing.
    #
    # Returns Arguments instance.
    #
    def arguments(args=(not_set = true), options={}, &block)
      if not_set
        @arguments
      else
        @arguments = Arguments.new(self, options).parse(*args, &block)
      end
    end

    # Scope for passing request required arguments.
    #
    def with(args)
      case args
        when Hash
          set args
        when /.*\/.*/i
          user, repo = args.split('/')
          set :user => user, :repo => repo
        else
          ::Kernel.raise ArgumentError, 'This api does not support passed in arguments'
      end
    end

    # Set an option to a given value
    def set(option, value=(not_set=true), ignore_setter=false, &block)
      raise ArgumentError, 'value not set' if block and !not_set
      return self if !not_set and value.nil?

      if not_set
        set_options option
        return self
      end

      if respond_to?("#{option}=") and not ignore_setter
        return __send__("#{option}=", value)
      end

      define_accessors option, value
      self
    end

    private

    def extract_id_from_response(resp)
      extract_id_from_location(resp.response.headers["location"])
    end

    def extract_id_from_location(location)
      location.scan(/\/(\d+)\/$/).first.first
    end

    # Set multiple options
    #
    def set_options(options)
      unless options.respond_to?(:each)
        raise ArgumentError, 'cannot iterate over value'
      end
      options.each { |key, value| set(key, value) }
    end

    def define_accessors(option, value)
      setter = proc { |val|  set option, val, true }
      getter = proc { value }

      define_singleton_method("#{option}=", setter) if setter
      define_singleton_method(option, getter) if getter
    end

    # Dynamically define a method for setting request option
    #
    def define_singleton_method(method_name, content=Proc.new)
      (class << self; self; end).class_eval do
        undef_method(method_name) if method_defined?(method_name)
        if String === content
          class_eval("def #{method_name}() #{content}; end")
        else
          define_method(method_name, &content)
        end
      end
    end

  end
end