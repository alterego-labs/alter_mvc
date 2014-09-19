require 'spec_helper'
require 'active_record'
require 'active_model'

class User
  attr_reader :password, :errors

  def initialize(params = {})
    @errors = ActiveModel::Errors.new(self)
    params.each { |k, v| instance_variable_set("@#{k}", v) }
  end
end

class TestingValidator < AlterMvc::Validator
  validate :password_presence
  def password_presence
    add_error('Some error') if model.password.blank?
  end
end

describe AlterMvc::Validator do
  
  Given(:validator) { TestingValidator.new model }
  Given(:model) { User.new(attributes) }
  Given(:right_attrs) { {password: 'test'} }
  Given(:wrong_attrs) { {password: nil} }

  When(:validating) { validator.valid? }

  context 'when validated successfully' do
    
    Given(:attributes) { right_attrs }

    Then { validating == true }

  end

  context 'when validating fail' do

    Given(:attributes) { wrong_attrs }

    Then { validating == false }
    
  end

end