require "alter_mvc/version"

module AlterMvc

  autoload :Model,                   'alter_mvc/model'
  autoload :BasicPresenter,          'alter_mvc/basic_presenter'
  autoload :BasicServiceObject,      'alter_mvc/basic_service_object'
  autoload :BasicQuery,              'alter_mvc/basic_query'
  autoload :BasicUseCase,            'alter_mvc/basic_use_case'
  autoload :BasicResponder,          'alter_mvc/basic_responder'
  autoload :BasicParameterSanitizer, 'alter_mvc/basic_parameter_sanitizer'
  autoload :BasicValidator,          'alter_mvc/basic_validator'
  autoload :Constants,               'alter_mvc/constants'

  module Concerns

    autoload :BasicConcern,      'alter_mvc/concerns/basic_concern'
    autoload :ServiceObjectable, 'alter_mvc/concerns/service_objectable'
    autoload :Presentable,       'alter_mvc/concerns/presentable'
    autoload :Querable,          'alter_mvc/concerns/querable'

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

end
