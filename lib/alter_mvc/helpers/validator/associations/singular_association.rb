require 'active_support/core_ext/string/inflections'

module AlterMvc
  module Helpers
    module Validator
      module Associations
        class SingularAssociation < BaseAssociation
          def validate_on(object)
            item = object.send name
            process_assoc_item item, object
          end
        end
      end
    end
  end
end
