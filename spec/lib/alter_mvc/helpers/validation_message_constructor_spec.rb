require 'spec_helper'

I18n.backend.store_translations :en, some_validator: {
  errors:{
    message_key: 'Some translated message'
  }
}

class SomeValidator
end

describe AlterMvc::Helpers::ValidationMessageConstructor do
  
  Given(:messanger) { described_class.new(SomeValidator, message) }

  When(:make_constructed) { messanger.construct }

  context 'when String passed' do
    
    Given(:message) { 'Some validation message' }
    Then { make_constructed == message }

  end

  context 'when Symbol passed' do

    Given(:message) { :message_key }
    Then { make_constructed == 'Some translated message' }

  end

end