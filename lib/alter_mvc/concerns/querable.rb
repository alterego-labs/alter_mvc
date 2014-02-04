require 'active_support/core_ext/string'

module AlterMvc::Concerns::Querable
  extend AlterMvc::Concerns::BasicConcern

  build_concern :query

end