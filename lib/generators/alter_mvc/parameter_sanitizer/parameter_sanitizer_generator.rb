require 'generators/alter_mvc'

module AlterMvc
  module Generators
    class ParameterSanitizerGenerator < Base

      def add_parameter_sanitizer
        template "parameter_sanitizer.rb", File.join('app/parameter_sanitizers/', "#{file_name.singularize}_parameter_sanitizer.rb")
      end

    end
  end
end

