require 'delegate'

module AlterMvc
  module Helpers
    # Wrapper around ActionController for responder
    class ResponderController < SimpleDelegator
      def request_xhr?
        request.xhr?
      end

      def request_type
        request_xhr? ? :js : :html
      end

      def flash_msg(type, message)
        flash[type] = message
      end
    end
  end
end
