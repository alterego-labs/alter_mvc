require 'generators/alter_mvc'

module AlterMvc
  module Generators
    class ServiceObjectGenerator < Base

      def add_domain_logic
        template "service_object.rb", File.join('app/service_objects/', "#{file_name.singularize}_service_object.rb")
      end

    end
  end
end