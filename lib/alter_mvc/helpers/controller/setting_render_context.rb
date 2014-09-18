module AlterMvc
  module Helpers
    module Controller
      module SettingRenderContext
        def self.extended(base)
          base.send :eval, <<-CODE
            before_action :set_current_controller
          CODE
          base.send :define_method, :set_current_controller do
            AlterMvc::Config.render_context = self
          end
        end
      end
    end
  end
end
 