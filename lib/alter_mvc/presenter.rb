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

    def rendering(as: nil, with: nil, options: {})
      render_view "", with, build_rendering_params(as, options)
    end

  end
end