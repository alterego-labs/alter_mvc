require 'active_support/core_ext/string'

module AlterMvc::Concerns::ServiceObjectable
  extend AlterMvc::Concerns::BasicConcern

  build_concern :service_object

end