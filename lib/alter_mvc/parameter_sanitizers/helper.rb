module AlterMvc::ParameterSanitizers::Helper

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods

    def params_for(resource)
      if resource.class.is_a? Hash
        define_fetch_params_method resource.keys.first, resource.values.first
      else
        define_fetch_params_method resource
      end
    end

  private

    def define_fetch_params_method(resource_name, attributes = [])
      instance_eval make_fetch_param_method_code(resource_name, make_permit(attributes))
    end

    def make_permit(attributes)
      attributes.any? ? "(#{attributes})" : '!'
    end

    def make_fetch_param_method_code(resource_name, permit)
      <<-CODE
        def #{resource_name}_params
          params.require(:#{resource_name}).permit#{permit}
        end
      CODE
    end

  end

end
