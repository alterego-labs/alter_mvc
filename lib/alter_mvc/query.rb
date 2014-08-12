require 'delegate'

module AlterMvc
  class Query < SimpleDelegator

    alias :model :__getobj__

    def initialize(base = nil)
      super(base || self.class.default_base)
    end

    def self.method_missing(meth, *args, &blk)
      self.new(default_base).send meth, *args
    end

    private
    def self.default_base
      @_model_class ||= self.name.gsub("Query", "").constantize.unscoped
    end

  end
end