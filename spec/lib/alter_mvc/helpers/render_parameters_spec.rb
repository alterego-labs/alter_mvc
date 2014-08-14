require 'spec_helper'

class AnotherPresenter; end

describe AlterMvc::Helpers::RenderParameters do
  
  Given(:model)    { AnotherPresenter.new }
  Given(:template) { 'some_template' }
  Given(:helper)   { described_class.new(model) }

  context 'generates params for custom rendering' do
    
    Given(:valid_result) { {partial: "shared/another/#{template}", locals: { another: model }} }
    When(:gen_result)    { helper.gen_custom template }
    Then                 { gen_result == valid_result }

  end

  context 'generates params for self rendering' do
    
    Given(:valid_result) { {partial: "anothers/render/#{template}", locals: { another: model }} }
    When(:gen_result)    { helper.gen_self template }
    Then                 { gen_result == valid_result }

  end

  context 'passing additional options' do
    
    Given(:valid_result) { {partial: "anothers/render/#{template}", locals: { another: model, param1: true}} }
    When(:gen_result)    { helper.gen_self template, {param1: true} }
    Then                 { gen_result == valid_result }    

  end

end