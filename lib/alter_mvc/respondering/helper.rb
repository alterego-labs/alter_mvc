module AlterMvc
  module Respondering
    # Set of helper methods for responder
    module Helper
      protected

      def call_method
        send(dispatch_call_method)
      end

      def process_method_exists?
        respond_to? dispatch_call_method, true
      end

      def dispatch_type
        controller.request.xhr? ? :js : :html
      end

      def dispatch_call_method
        "#{controller.action_name}_#{dispatch_type}"
      end

      def shared_view(name)
        "/shared/responders/#{dispatch_type}/#{name}"
      end

      def flash_msg(type, message)
        controller.flash[type] = message
      end

      def flash_notice(message)
        flash_msg :notice, message
      end

      def flash_alert(message)
        flash_msg :alert, message
      end

      def run_responder
        if process_method_exists?
          call_method
        else
          super
        end
      end
    end
  end
end
