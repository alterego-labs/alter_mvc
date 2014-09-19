require 'spec_helper'

class SomeValidator
end

describe AlterMvc::Helpers::Validator::Associations::BaseAssociation do
  
  Given(:item) { described_class.new(name, validator_class) }
  Given(:name) { :comments }
  Given(:validator_class) { SomeValidator }

  describe 'has name property' do
    When(:fetched_name) { item.name }
    Then { fetched_name == name }
  end

  describe 'has validator property' do
    When(:fetched_validator) { item.validator_class }
    Then { fetched_validator == validator_class }
  end
end
