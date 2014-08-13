require 'generators/alter_mvc'

module AlterMvc
  module Generators
    class RendererGenerator < Base

      def add_renderer
        template "renderer.rb", File.join('app/renderers/', "#{file_name.singularize}_renderer.rb")
      end

    end
  end
end