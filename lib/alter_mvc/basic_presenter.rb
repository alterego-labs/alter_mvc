require 'delegate'

module AlterMvc
  class BasicPresenter < SimpleDelegator

    attr_accessor :context

    def initialize(object, context = nil)
      @context = context
      super(object)
    end

    def self.arround(object, context = nil)
      self.new(object, context) if object
    end

    def self.arround_collection(collection, context = nil)
      collection.map { |c| new(c, context) }
    end

    def rendering(as: nil, with: nil)
      with.render partial: "#{view_namespace || resource_name.pluralize}/render/#{as}", locals: { :"#{resource_name}" => __getobj__ }
    end

    private

    def resource_name
      self.class.name.underscore.gsub('_presenter', '')
    end

    def view_namespace
      nil
    end

  end
end