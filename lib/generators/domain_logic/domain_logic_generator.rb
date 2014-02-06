require 'generators/alter_admin'

module AlterMvc
  module Generators
    class DomainLogicGenerator < Base

      def add_domain_logic
        template "domain_logic.rb", File.join('app/domain_logics/', "#{file_name.singularize}_domain_logic.rb")
      end

    end
  end
end