require 'spec_helper'

class BaseModelConcern
  def initialize(base)
  end
end

class NonModuleUserSomeConcern < BaseModelConcern;end
class NonModuleUser
  extend AlterMvc::Concerns::BasicConcern
end

module SomeExtensions
  module SomeSubModule
    class UserSomeConcern < BaseModelConcern; end
    class User
      extend AlterMvc::Concerns::BasicConcern   
    end
  end
end

describe AlterMvc::Concerns::BasicConcern do
  
  Given(:model) { test_class.new }

  context 'concerning non module model' do
    
    Given(:test_class) { NonModuleUser }
    When { test_class.build_concern(:some_concern) }
    Then { model.some_concern != nil }
    And  { expect(model.some_concern).to be_kind_of(NonModuleUserSomeConcern) }

  end

  context 'concerning model in modules' do
    
    Given(:test_class) { SomeExtensions::SomeSubModule::User }
    When { test_class.build_concern(:some_concern) }
    Then { model.some_concern != nil }
    And  { expect(model.some_concern).to be_kind_of(SomeExtensions::SomeSubModule::UserSomeConcern) }

  end

end