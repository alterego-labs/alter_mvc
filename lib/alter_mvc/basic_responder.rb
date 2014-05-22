require "responders"
require 'alter_mvc/respondering/helper'

module AlterMvc
  class BasicResponder < ActionController::Responder
    include AlterMvc::Respondering::Helper
    include Responders::FlashResponder

    AlterMvc::Constants::VIEWABLE_ACTIONS.each do |action|
      define_method "#{action}_js" do render action end
      define_method "#{action}_html" do render action end
    end

    AlterMvc::Constants::RESPONDER_TYPES.each do |type|
      define_method "to_#{type}" do run_responder end
    end

  end
end