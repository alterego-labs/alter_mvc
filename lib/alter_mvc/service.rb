require 'delegate'

module AlterMvc
  class Service < SimpleDelegator
    include AlterMvc::Helpers::ModelConcern

  end
end