require 'responders'
require 'alter_mvc/respondering/helper'

module AlterMvc
  # Responsible for exposing a resource to different mime requests,
  # usually depending on the HTTP verb. The responder is triggered when
  # <code>respond_with</code> is called.
  class Responder < ActionController::Responder
    include AlterMvc::Respondering::Helper
    include Responders::FlashResponder

    def to_html
      run_responder
    end

    def to_js
      run_responder
    end
  end
end
