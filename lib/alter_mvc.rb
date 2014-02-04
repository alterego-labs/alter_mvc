require "alter_mvc/version"

module AlterMvc

  autoload :Model,               'alter_mvc/model'
  autoload :BasicPresenter,      'alter_mvc/basic_presenter'
  autoload :BasicDomainLogic,    'alter_mvc/basic_domain_logic'
  autoload :BasicQuery,          'alter_mvc/basic_query'
  autoload :Constants,           'alter_mvc/constants'
  autoload :BasicUseCase,        'alter_mvc/basic_use_case'

  module Concerns

    autoload :BasicConcern,    'alter_mvc/concerns/basic_concern'
    autoload :DomainLogicable, 'alter_mvc/concerns/domain_logicable'
    autoload :Presentable,     'alter_mvc/concerns/presentable'
    autoload :Querable,        'alter_mvc/concerns/querable'

  end

  module Extensions

    autoload :CollectionRenderable, 'alter_mvc/extensions/collection_renderable'

  end

end
