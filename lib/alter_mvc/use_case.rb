module AlterMvc
  class UseCase

    def initialize(params = {})
      params.each { |k, v| instance_variable_set("@#{k}", v) }
    end

    def execute
      raise 'Must be implemented!'
    end

    class << self

      def execute(*args)
        warn "[DEPRECATION] calling class method `execute` is deprecated.  Please use instance method instead."
        raise 'Must be implemented!'
      end

    end
  end
end