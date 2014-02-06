require 'generators/alter_admin'

module AlterMvc
  module Generators
    class PresenterGenerator < Base

      def add_presenter
        template "presenter.rb", File.join('app/presenters/', "#{file_name.singularize}_presenter.rb")
      end

    end
  end
end