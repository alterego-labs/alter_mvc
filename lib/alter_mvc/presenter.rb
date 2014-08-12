require 'delegate'
require 'alter_mvc/presenters/helper'

module AlterMvc
  class Presenter < SimpleDelegator
    include AlterMvc::Presenters::Helper

    alias :model :__getobj__

    def initialize(object)
      super(object)
    end

    def self.arround(object)
      self.new(object) if object
    end

    def self.arround_collection(collection)
      collection.map { |c| new(c) }
    end

    def self.draw(name, &block)
      define_method "draw_#{name}" do
        instance_eval &block
      end
    end

    def method_missing(meth, *args, &blk)
      model.send meth, *args
    end

    def rendering(as: nil, with: nil, options: {})
      render_view "", with, build_rendering_params(as, options)
    end

  end
end