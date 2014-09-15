require 'generators/alter_mvc'

module AlterMvc
  module Generators
    class DecoratorGenerator < Base

      def add_decorator
        template "decorator.rb", File.join('app/decorators/', "#{file_name.singularize}_decorator.rb")
      end

    end
  end
end