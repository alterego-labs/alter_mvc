require 'active_support/core_ext/string/inflections'

module AlterMvc
  module Helpers
    module Validator
      module Associations
        class BaseAssociation < Struct.new(:name, :validator_class)
          def validate_on(_object)
            fail NotImplementedError, "#{self.class.name} is an abstract class."
          end

          protected

          def process_assoc_item(item, object)
            validator = validator_class.new(item)
            validation_result = validator.valid?
            copy_error_messages validator, object
            validation_result
          end

          def copy_error_messages(validator, object)
            validator.errors_messages.each do |(scope, message)|
              object.add_error message, scope: scope
            end
          end
        end
      end
    end
  end
end
