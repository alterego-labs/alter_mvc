require 'active_support/core_ext/string/inflections'

module AlterMvc
  module Helpers
    module Validator
      module Associations
        class PluralAssociation < BaseAssociation
          def validate_on(object)
            items = object.send name
            items.reduce(true) do |res, item|
              res && process_assoc_item(item, object)
            end
          end
        end
      end
    end
  end
end
