require 'spec_helper'

class SomePresenter < AlterMvc::Presenter
  
  draw :some_value do
    "decorated_#{some_value}"
  end

end

describe AlterMvc::Presenter do
  
  Given(:model)     { double(:model, some_value: 'some_value') }
  Given(:presenter) { SomePresenter.new(model) }

  context 'calling defined draw method' do
    
    When(:result) { presenter.draw_some_value }
    Then { result == 'decorated_some_value' }

  end

end