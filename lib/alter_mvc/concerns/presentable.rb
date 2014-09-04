require 'active_support/core_ext/string'

require 'alter_mvc/extensions/array_extension'
require 'alter_mvc/extensions/hash_extension'
require 'alter_mvc/extensions/collection_proxy_extension'
require 'alter_mvc/extensions/association_relation_extension'
require 'alter_mvc/extensions/relation_extension'

module AlterMvc
  module Concerns
    # Presentable concern for objects
    #
    # ==== Examples
    #
    # # Lets add to User presentable ability
    # class User
    #   include AlterMvc::Concerns::Presentable
    #   attr_reader :first_name, :last_name
    # end
    # # Define presentable class:
    # class UserPresenter < AlterMvc::Presenter
    #   draw :full_name { "#{first_name} #{last_name}" }
    # end
    # # And now user instance has #draw_full_name method
    module Presentable
      extend AlterMvc::Concerns::BasicConcern

      build_concern :presenter
    end
  end
end
