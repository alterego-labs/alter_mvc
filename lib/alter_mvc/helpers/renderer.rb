module AlterMvc
  module Helpers
    module Renderer

      def render_view(name, view_context, options = {})
        view_context.render(build_render_params(name, options)).html_safe
      end

      def build_rendering_params(as, options = {})
        {partial: "#{resource_name.pluralize}/render/#{as}", locals: { :"#{resource_name}" => model }.merge(options)}
      end

      def build_render_params(name, options)
        {partial: build_view_path(name)}.merge options
      end

      def build_view_path(name)
        "#{view_namespace}/#{name}"
      end

      def resource_name
        self.class.name.underscore.gsub('_presenter', '')
      end

      def view_namespace
        nil
      end
        
    end
  end
end