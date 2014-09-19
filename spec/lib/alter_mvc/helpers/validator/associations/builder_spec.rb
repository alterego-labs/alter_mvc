require 'spec_helper'

include AlterMvc::Helpers::Validator::Associations

describe Builder do

  Given(:builder) { described_class }
  Given(:validator_class) { 'SomeValidator' }

  When(:builted_association) { builder.by_name(name, validator_class) }

  context 'when passing plural name' do
    Given(:name) { :comments }
    Then { builted_association.is_a?(PluralAssociation) }
  end

  context 'when passing singular name' do
    Given(:name) { :comment }
    Then { builted_association.is_a?(SingularAssociation) }
  end
end
