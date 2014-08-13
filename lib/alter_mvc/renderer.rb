require 'delegate'

module AlterMvc
  class Renderer < SimpleDelegator
    include AlterMvc::Helpers::Renderer
    include AlterMvc::Helpers::ModelConcern

    def self.render(name, *args, &block)
      define_method "render_#{name}" do |*args|
        instance_exec *args, &block
      end
    end

    def rendering(as: nil, with: nil, options: {})
      render_view "", with, build_rendering_params(as, options)
    end

  end
end