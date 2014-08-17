require 'spec_helper'
require 'delegate'

class User;end
class UserConcern < SimpleDelegator;end

module SomeConcerns
  class User;end
  class UserConcern < SimpleDelegator;end
end

describe AlterMvc::Helpers::ModelConcern do
  
  context 'concern for unmoduled model' do
  
    Given(:test_class) { UserConcern }
    When { test_class.send :include, AlterMvc::Helpers::ModelConcern }
    When(:base) { test_class.new.model }
    Then { base == User }

  end

  context 'concern for moduled model' do

    Given(:test_class) { SomeConcerns::UserConcern }
    When { test_class.send :include, AlterMvc::Helpers::ModelConcern }
    When(:base) { test_class.new.model }
    Then { base == SomeConcerns::User }
    
  end

end