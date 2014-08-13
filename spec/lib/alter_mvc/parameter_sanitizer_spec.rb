require 'spec_helper'
require 'active_support'
require 'action_controller'
require 'active_support/core_ext/class/attribute_accessors'
require 'action_controller/metal/strong_parameters'

class SomeParametizer < AlterMvc::ParameterSanitizer
  
  param :param1

  param :param2, scope: ->(s) { s.params[:scoped] }

  resource res: [:param3]

end

describe AlterMvc::ParameterSanitizer do
  
  Given(:params)    { ActionController::Parameters.new(post_params) }
  Given(:sanitizer) { SomeParametizer.new(params) }

  context 'with resource' do

    Given(:post_params) { {res: {param2: 'value2', param3: 'value3'}} }
    
    context 'when accessing not permitting attr' do
      
      When(:result) { sanitizer.res_params[:param2] }
      Then { result == nil }

    end

    context 'when accessing permitting attr' do

      When(:result) { sanitizer.res_params[:param3] }
      Then { result == 'value3' }
      
    end

  end

  context 'with single params' do

    Given(:post_params) { {param1: 'value1', scoped: {param2: 'value2'}} }

    context 'with scoping' do
      
      When(:result) { sanitizer.param2 }
      Then { result == 'value2' }

    end

    context 'without scoping' do

      When(:result) { sanitizer.param1 }
      Then { result == 'value1' }
      
    end
    
  end

end