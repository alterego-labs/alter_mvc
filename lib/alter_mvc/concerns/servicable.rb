require 'active_support/core_ext/string'

module AlterMvc
  module Concerns
    # Servicable concern for objects.
    # Contains domain logic of class.
    #
    # ==== Examples
    #
    # # Lets add to User servicable ability
    # class User
    #   include AlterMvc::Concerns::Servicable
    #   attr_reader :born_at
    # end
    # # Define presentable class:
    # class UserService < AlterMvc::Service
    #   def age
    #     Time.now.year - born_at.year
    #   end
    # end
    # # And now user instance has #age method
    module Servicable
      extend AlterMvc::Concerns::BasicConcern

      build_concern :service
    end
  end
end
