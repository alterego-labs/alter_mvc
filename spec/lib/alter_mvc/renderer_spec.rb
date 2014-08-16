require 'spec_helper'

class SomeRenderer < AlterMvc::Renderer; end

describe AlterMvc::Renderer do
  
  Given(:render)   { SomeRenderer.new(double) }
  Given(:model)    { double(:model, renderer: render) }
  Given(:renderer) { SomeRenderer.new(model) }

  context 'defining render methods' do
    
    When { renderer.class.render(:some_value) do "render_value" end }
    When(:result) { renderer.render_some_value }
    Then { result == 'render_value' }

  end

  context 'self rendering' do
    
    before { expect(renderer).to receive(:render).and_return 'render result' }

    When(:result) { renderer.rendering(as: :some) }
    Then { result == 'render result' }

  end

  context 'rendering by default' do

    before { expect(render).to receive(:render).with(:default_value).and_return 'default value' }
    
    When(:result) { renderer.render_default_value }
    Then          { result == 'default value' }

  end

end