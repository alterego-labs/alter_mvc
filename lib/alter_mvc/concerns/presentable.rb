require 'active_support/core_ext/string'

require 'alter_mvc/extensions/array_extension'
require 'alter_mvc/extensions/hash_extension'
require 'alter_mvc/extensions/collection_proxy_extension'
require 'alter_mvc/extensions/association_relation_extension'
require 'alter_mvc/extensions/relation_extension'

module AlterMvc::Concerns::Presentable
  extend AlterMvc::Concerns::BasicConcern

  build_concern :presenter

end