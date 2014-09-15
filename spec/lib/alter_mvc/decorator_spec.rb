require 'spec_helper'

class SomeDecorator < AlterMvc::Decorator
  
  draw :some_value do
    "decorated_#{some_value}"
  end

end

describe AlterMvc::Decorator do
  
  Given(:model)     { double(:model, some_value: 'some_value') }
  Given(:decorator) { SomeDecorator.new(model) }

  context 'calling defined draw method' do
    
    When(:result) { decorator.draw_some_value }
    Then { result == 'decorated_some_value' }

  end

end