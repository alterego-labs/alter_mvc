require 'active_support/core_ext/string'

module AlterMvc::Concerns::ServiceObjectable
  extend AlterMvc::Concerns::BasicConcern

  build_concern :domain_logic

end