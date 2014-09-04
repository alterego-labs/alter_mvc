module AlterMvc
  module Helpers
    module Renderer
      protected

      def render(template, options = {})
        render_context.render(render_opts(template, options)).html_safe
      end

      def rendering_opts(template, options = {})
        render_params.gen_self template, options
      end

      def render_opts(template, options)
        render_params.gen_custom template, options
      end

      def render_context
        AlterMvc::Config.render_context
      end

      def render_params
        @_render_params ||= AlterMvc::Helpers::RenderParameters.new(model)
      end
    end
  end
end
