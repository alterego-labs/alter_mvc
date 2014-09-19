require 'active_support'
require 'active_support/core_ext/module/aliasing'
require 'active_support/core_ext/class/attribute_accessors'
require 'pry'
module AlterMvc
  module Helpers
    module Validator
      module AssociationValidation
        extend ActiveSupport::Concern

        included do
          cattr_reader :validations_register
          @@validations_register = []
          alias_method_chain :valid?, :associations
        end

        def valid_with_associations?
          register = self.class.validations_register
          assoc_result = register.reduce(true) do |res, item|
            res && item.validate_on(self)
          end
          assoc_result && valid_without_associations?
        end

        module ClassMethods
          def validating(name, with:)
            register = validations_register
            register << Associations::Builder.by_name(name, with)
            @@validations_register = register
          end
        end
      end
    end
  end
end
