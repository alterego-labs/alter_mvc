require 'delegate'
require 'alter_mvc/presenters/helper'

module AlterMvc
  class Presenter < SimpleDelegator
    include AlterMvc::Presenters::Helper
    include AlterMvc::Helpers::ModelConcern

    def self.draw(name, *args, &block)
      define_method "draw_#{name}" do |*args|
        instance_exec *args, &block
      end
    end

    def rendering(as: nil, with: nil, options: {})
      render_view "", with, build_rendering_params(as, options)
    end

  end
end