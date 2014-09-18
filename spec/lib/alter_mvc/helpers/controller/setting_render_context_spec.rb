require 'spec_helper'

class CheckController
  def self.before_action(*args); end
  extend AlterMvc::Helpers::Controller::SettingRenderContext
end

describe AlterMvc::Helpers::Controller::SettingRenderContext do
  
  Given(:controller) { CheckController.new }

  context 'defines method for saving context' do
    When { controller.set_current_controller }
    Then { AlterMvc::Config.render_context == controller }
  end

end