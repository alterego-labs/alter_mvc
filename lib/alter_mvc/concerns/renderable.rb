require 'active_support/core_ext/string'

module AlterMvc::Concerns::Renderable
  extend AlterMvc::Concerns::BasicConcern

  build_concern :renderer

end