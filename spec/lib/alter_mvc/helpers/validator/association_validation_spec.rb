require 'spec_helper'

include AlterMvc::Helpers::Validator

class CustomValidator
  def valid?; true; end
  include AssociationValidation
  def comments
    [Object.new]
  end
end

class CommentsValidator
  def initialize(*_args); end
  def valid?; false; end
  def errors_messages; {}; end 
end

describe AssociationValidation do
  
  Given(:validator) { CustomValidator.new }

  When(:associations) { validator.class.validations_register }
  Then { expect(associations).to be_empty }

  context 'checks filling association register' do
    When { validator.class.validating(:comments, with: CommentsValidator) }
    When(:associations) { validator.class.validations_register }
    Then { expect(associations).to_not be_empty }

    context 'and validating with it' do
      When(:validation_result) { validator.valid? }
      Then { expect(validation_result).to be_falsey }
    end
  end
end
