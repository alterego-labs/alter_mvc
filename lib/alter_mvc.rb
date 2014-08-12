require "alter_mvc/version"

module AlterMvc

  autoload :Presenter,          'alter_mvc/presenter'
  autoload :Service,            'alter_mvc/service'
  autoload :Query,              'alter_mvc/query'
  autoload :UseCase,            'alter_mvc/use_case'
  autoload :Responder,          'alter_mvc/responder'
  autoload :ParameterSanitizer, 'alter_mvc/parameter_sanitizer'
  autoload :Validator,          'alter_mvc/validator'
  autoload :Constants,          'alter_mvc/constants'

  module Concerns

    autoload :BasicConcern, 'alter_mvc/concerns/basic_concern'
    autoload :Servicable,   'alter_mvc/concerns/servicable'
    autoload :Presentable,  'alter_mvc/concerns/presentable'
    autoload :Querable,     'alter_mvc/concerns/querable'

  end

  module Presenters

    autoload :Helper,            'alter_mvc/presenters/helper'

  end

  module Respondering

    autoload :Helper,            'alter_mvc/respondering/helper'

  end

  module ParameterSanitizers

    autoload :Helper,            'alter_mvc/parameter_sanitizers/helper'
    
  end

  module Extensions

    autoload :CollectionRenderable, 'alter_mvc/extensions/collection_renderable'

  end

  module Helpers
  
    autoload :BaseCommand,  'alter_mvc/helpers/base_command'
    autoload :ModelConcern, 'alter_mvc/helpers/model_concern'

  end

end
