require 'generators/alter_mvc'

module AlterMvc
  module Generators
    class ServiceObjectGenerator < Base

      def add_service_object
        template "service_object.rb", File.join('app/service_objects/', "#{file_name.singularize}_service_object.rb")
      end

    end
  end
end