require 'delegate'
require 'render_anywhere'

module AlterMvc
  class BasicPresenter < SimpleDelegator
    include RenderAnywhere

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

    def rendering(as: nil, with: nil)
      render partial: "#{view_namespace || resource_name.pluralize}/render/#{as}", locals: { :"#{resource_name}" => model }
    end

    private

    def render_view(name, options = {})
      render(build_render_params(name, options)).html_safe
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