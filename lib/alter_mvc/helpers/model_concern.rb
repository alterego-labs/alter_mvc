require 'active_support/core_ext/string/inflections'

module AlterMvc
  module Helpers
    module ModelConcern

      def self.included(base)
        base.send :extend, ClassMethods
        base.send :class_eval, "alias :model :__getobj__"
      end

      def initialize(base = nil)
        super(base || self.class.default_base)
      end

      def method_missing(meth, *args, &blk)
        AlterMvc::Helpers::MethodDispatcher.new(self, model).call meth, *args
      end

      module ClassMethods
        
        def default_base
          @_model_class ||= resource_name.constantize
        end

      protected

        def resource_name
          self.name.gsub /[A-Z][a-z0-9]+$/, ""
        end

        def extension_type
          self.name.scan(/[A-Z][a-z0-9]+/).last.downcase
        end

      end

    end
  end
end