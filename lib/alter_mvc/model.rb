module AlterMvc
  class Model < ActiveRecord::Base
    include AlterMvc::Concerns::DomainLogicable
    include AlterMvc::Concerns::Presentable
    include AlterMvc::Concerns::Querable

  end
end