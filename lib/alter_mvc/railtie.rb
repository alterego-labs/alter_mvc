module AlterMvc
  class Railtie < Rails::Railtie
    config.after_initialize do
      ActiveSupport.on_load(:action_controller) do
        extend AlterMvc::Helpers::Controller::SettingRenderContext
        include AlterMvc::Helpers::Controller::ParamsConventions
      end
    end
  end
end
