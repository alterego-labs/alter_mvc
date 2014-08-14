require 'spec_helper'

class SomeRenderer < AlterMvc::Renderer; end

describe AlterMvc::Renderer do
  
  Given(:model)    { double(:model) }
  Given(:renderer) { SomeRenderer.new(model) }

  context 'defining render methods' do
    
    When { renderer.class.render(:some_value) do "render_value" end }
    When(:result) { renderer.render_some_value }
    Then { result == 'render_value' }

  end

  context 'self rendering' do
    
    before { expect(renderer).to receive(:render_view).and_return 'render result' }

    When(:result) { renderer.rendering(as: :some) }
    Then { result == 'render result' }

  end

end