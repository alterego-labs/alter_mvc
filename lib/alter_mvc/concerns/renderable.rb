require 'active_support/core_ext/string'

module AlterMvc
  module Concerns
    # Renderable concern for objects
    #
    # ==== Examples
    #
    # # Lets add to User renderable ability
    # class User
    #   include AlterMvc::Concerns::Renderable
    # end
    # # Define renderable class:
    # class UserRenderer < AlterMvc::Renderer
    #   render :messages do
    #     render :messages
    #   end
    # end
    # # And now user instance has #render_messages method
    #
    # # Default render methods: if your rendering body is simple
    # # like in example below use render by default feature. For example:
    # = user.render_items
    # # will automatically render :items partial
    #
    # # Partial paths
    # # For self-rendering partial will be search in:
    # # app/views/:resource_name/render/:_partial_name
    # # For custom rendering partial will be search in:
    # # app/views/shared/:resource_name/:_partial_name
    module Renderable
      extend AlterMvc::Concerns::BasicConcern

      build_concern :renderer
    end
  end
end
