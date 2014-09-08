require 'responders'
require 'active_support/core_ext/module/delegation'

module AlterMvc
  # Responsible for exposing a resource to different mime requests,
  # usually depending on the HTTP verb. The responder is triggered when
  # <code>respond_with</code> is called.
  class Responder < ActionController::Responder
    include Responders::FlashResponder

    attr_reader :resp_controller

    delegate :request_xhr?,
             :request_type,
             :action_name,
             :flash_msg, to: :resp_controller

    alias_method :base_to_html, :to_html
    alias_method :base_to_js,   :to_js

    def initialize(*args)
      super
      @resp_controller = AlterMvc::Helper::ResponderController.new(controller)
    end

    def to_html
      run_responder_for :html
    end

    def to_js
      run_responder_for :js
    end

    protected

    def run_responder_for(type)
      if process_method_exists?
        call_method
      else
        call_base_for type
      end
    end

    def call_method
      send(request_method_name)
    end

    def call_base_for(type)
      send "base_to_#{type}"
    end

    def process_method_exists?
      respond_to? request_method_name, true
    end

    def request_method_name
      "#{action_name}_#{request_type}"
    end

    def path_with_request_type
      "/shared/responders/#{request_type}"
    end

    def shared_view(name)
      "#{path_with_request_type}/#{name}"
    end

    def flash_notice(message)
      flash_msg :notice, message
    end

    def flash_alert(message)
      flash_msg :alert, message
    end
  end
end
