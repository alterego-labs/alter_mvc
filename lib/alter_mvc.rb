require "alter_mvc/version"

module AlterMvc

  autoload :Model, 'alter_mvc/model'

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
