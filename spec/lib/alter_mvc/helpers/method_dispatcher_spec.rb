require 'spec_helper'

describe AlterMvc::Helpers::MethodDispatcher do
  
  Given(:args)    { double(:args) }
  Given(:model)   { double(:model, renderer: renderer) }
  Given(:renderer)   { double(:renderer) }
  Given(:concern) { double(:concern) }
  Given(:dispatcher) { described_class.new(concern, model) }

  context 'when dispatching no default method' do
    
    Given(:action) { :some_action }

    before { expect(model).to receive(action).and_return('action result') }

    When(:result) { dispatcher.call(action, args) }
    Then { result == 'action result' }

  end

  context 'when dispatching default method for renderer' do
    
    Given(:action) { :render_some_template }

    before { expect(renderer).to receive(:default_action).with(:some_template, args).and_return('some template view') }

    When(:result) { dispatcher.call(action, args) }
    Then { result == 'some template view' }

  end

end