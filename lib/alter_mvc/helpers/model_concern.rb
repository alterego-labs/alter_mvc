module AlterMvc
  module Helpers
    module ModelConcern
      
      alias :model :__getobj__
      
      def self.included(base)
        base.send :extend, ClassMethods
      end

      def initialize(base = nil)
        super(base || self.class.default_base)
      end

      def method_missing(meth, *args, &blk)
        model.send meth, *args
      end

      module ClassMethods
        
      private

        def default_base
          @_model_class ||= model_name.constantize.unscoped
        end

        def model_name
          self.name.gsub /[A-Z][a-z0-9]+$/, ""
        end

      end

    end
  end
end