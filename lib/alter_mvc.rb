require 'alter_mvc/version'

module AlterMvc

  autoload :Decorator,          'alter_mvc/decorator'
  autoload :Renderer,           'alter_mvc/renderer'
  autoload :Service,            'alter_mvc/service'
  autoload :Query,              'alter_mvc/query'
  autoload :UseCase,            'alter_mvc/use_case'
  autoload :ParameterSanitizer, 'alter_mvc/parameter_sanitizer'
  autoload :Validator,          'alter_mvc/validator'
  autoload :Command,            'alter_mvc/command'
  autoload :Config,             'alter_mvc/config'

  module Concerns

    autoload :BasicConcern, 'alter_mvc/concerns/basic_concern'
    autoload :Servicable,   'alter_mvc/concerns/servicable'
    autoload :Decorable,    'alter_mvc/concerns/decorable'
    autoload :Querable,     'alter_mvc/concerns/querable'

  end

  module ParameterSanitizers

    autoload :Helper,            'alter_mvc/parameter_sanitizers/helper'
    
  end

  module Extensions

    autoload :CollectionRenderable, 'alter_mvc/extensions/collection_renderable'

  end

  module Helpers
  
    autoload :BaseCommand,       'alter_mvc/helpers/base_command'
    autoload :ModelConcern,      'alter_mvc/helpers/model_concern'
    autoload :Renderer,          'alter_mvc/helpers/renderer'
    autoload :RenderParameters,  'alter_mvc/helpers/render_parameters'
    autoload :MethodDispatcher,  'alter_mvc/helpers/method_dispatcher'
    

    module Controller

      autoload :SettingRenderContext, 'alter_mvc/helpers/controller/setting_render_context'
      autoload :ParamsConventions, 'alter_mvc/helpers/controller/params_conventions'
      
    end

    module Validator
      
      autoload :AssociationValidation, 'alter_mvc/helpers/validator/association_validation'
      autoload :ErrorMessageConstructor, 'alter_mvc/helpers/validator/error_message_constructor'

      module Associations

        autoload :BaseAssociation, 'alter_mvc/helpers/validator/associations/base_association'
        autoload :Builder, 'alter_mvc/helpers/validator/associations/builder'
        autoload :PluralAssociation, 'alter_mvc/helpers/validator/associations/plural_association'
        autoload :SingularAssociation, 'alter_mvc/helpers/validator/associations/singular_association'

      end

    end

  end

end
