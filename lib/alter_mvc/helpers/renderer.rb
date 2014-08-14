module AlterMvc
  module Helpers
    module Renderer

    protected

      def render(name, options = {})
        render_context.render(render_opts(name, options)).html_safe
      end

      def rendering_opts(as, options = {})
        render_params self_rendering_view(as), opts_with_resource(options)
      end

      def render_opts(name, options)
        render_params custom_render_view(name), options
      end

      def view_namespace
        "shared/#{resource_name}"
      end

      def render_context
        AlterMvc::Config.render_context
      end

    private

      def render_params(partial_name, options = {})
        {partial: partial_name}.merge options
      end

      def self_rendering_view(name)
        "#{resource_name.pluralize}/render/#{name}"
      end

      def opts_with_resource(options = {})
        {locals: { :"#{resource_name}" => model }.merge(options)}
      end

      def custom_render_view(name)
        "#{view_namespace}/#{name}"
      end

      def resource_name
        self.class.name.underscore.gsub('_presenter', '')
      end
        
    end
  end
end