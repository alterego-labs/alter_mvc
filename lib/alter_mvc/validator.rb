require 'delegate'
require 'active_model'

module AlterMvc
  class Validator < SimpleDelegator
    include ActiveModel::Validations

    alias_method :model, :__getobj__

    private

    def errors
      model.errors
    end

    def add_error(message, scope: :base)
      errors[scope] << construct_message(message)
    end

    def construct_message(message)
      AlterMvc::Helpers::ValidationMessageConstructor.new(self.class, message).construct
    end
  end
end
