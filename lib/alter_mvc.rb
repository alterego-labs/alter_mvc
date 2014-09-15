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
  
    autoload :BaseCommand,      'alter_mvc/helpers/base_command'
    autoload :ModelConcern,     'alter_mvc/helpers/model_concern'
    autoload :Renderer,         'alter_mvc/helpers/renderer'
    autoload :Controller,       'alter_mvc/helpers/controller'
    autoload :RenderParameters, 'alter_mvc/helpers/render_parameters'
    autoload :MethodDispatcher, 'alter_mvc/helpers/method_dispatcher'

  end

end
