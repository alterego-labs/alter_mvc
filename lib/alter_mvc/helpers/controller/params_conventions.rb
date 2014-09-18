require 'active_support/core_ext/string/inflections'

module AlterMvc
  module Helpers
    module Controller
      module ParamsConventions
        def method_missing(name, *args, &_block)
          if params_fetching?(name)
            build_params_sanitizer(name)
          else
            super
          end
        end

        private

        def build_params_sanitizer(name)
          klass = SanitizerBuilder.new(name, self.class.name).build_class
          klass.new params
        end

        def params_fetching?(name)
          name =~ /_params$/
        end

        class SanitizerBuilder
          attr_reader :name, :controller_name
          def initialize(name, controller_name)
            @name = name
            @controller_name = controller_name
          end

          def build_class
            "#{namespace}::#{action.capitalize}ParameterSanitizer".constantize
          end

          private

          def namespace
            controller_name.to_s.gsub(/Controller$/, '')
          end

          def action
            name.to_s.gsub(/_params$/, '')
          end
        end
      end
    end
  end
end
