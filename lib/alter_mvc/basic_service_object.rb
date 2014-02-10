require 'delegate'

module AlterMvc
  class BasicServiceObject < SimpleDelegator

    alias :model :__getobj__

    def initialize(base = nil)
      super(base || self.class.default_base)
    end

    private
    def self.default_base
      @_model_class ||= self.name.gsub("ServiceObject", "").constantize.unscoped
    end

  end
end