require 'delegate'
require 'active_model'

module AlterMvc
  ##
  # Creates custom, use-case-dependently validators.
  # There are many cases when one model takes place in several use cases
  # requiring different validation logic. You may stuff goal model
  # with some conditions whether using this validation or not.
  # Due to this you model will swell and eventually become ugly part of code.
  #
  # ==== Example
  #
  # Lets defining validator when user signing up:
  # # class UserSignUpValidator < AlterMvc::Validator
  # #   validates :password, confirmation: true
  # # end
  #
  # And now in your use-case class use it:
  # # is_valid = UserSignUpValidator.new(new_user).valid?
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
      Helpers::ValidationMessageConstructor.new(self.class, message).construct
    end
  end
end
