require 'active_support/core_ext/string'

module AlterMvc
  module Concerns
    # Decorable concern for objects
    #
    # ==== Examples
    #
    # # Lets add to User decorable ability
    # class User
    #   include AlterMvc::Concerns::Decorable
    #   attr_reader :first_name, :last_name
    # end
    # # Define decorable class:
    # class UserDecorator < AlterMvc::Decorator
    #   draw :full_name { "#{first_name} #{last_name}" }
    # end
    # # And now user instance has #draw_full_name method
    module Decorable
      extend AlterMvc::Concerns::BasicConcern

      build_concern :decorator
    end
  end
end
