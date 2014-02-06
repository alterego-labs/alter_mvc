require 'generators/alter_admin'

module AlterMvc
  module Generators
    class ResponderGenerator < Base

      def add_responder
        template "responder.rb", File.join('app/responders/', "#{file_name.singularize}_responder.rb")
      end

    end
  end
end