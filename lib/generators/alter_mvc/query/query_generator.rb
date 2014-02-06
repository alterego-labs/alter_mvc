require 'generators/alter_mvc'

module AlterMvc
  module Generators
    class QueryGenerator < Base

      def add_query
        template "query.rb", File.join('app/queries/', "#{file_name.singularize}_query.rb")
      end

    end
  end
end