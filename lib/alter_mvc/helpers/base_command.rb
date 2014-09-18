module AlterMvc
  module Helpers
    class BaseCommand
      def initialize(params = {})
        params.each { |k, v| instance_variable_set("@#{k}", v) }
      end
    end
  end
end
