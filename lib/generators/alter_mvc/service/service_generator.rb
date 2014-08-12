require 'generators/alter_mvc'

module AlterMvc
  module Generators
    class ServiceGenerator < Base

      def add_service
        template "service.rb", File.join('app/services/', "#{file_name.singularize}_service.rb")
      end

    end
  end
end