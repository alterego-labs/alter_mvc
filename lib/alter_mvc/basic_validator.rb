require 'delegate'
require 'active_model'

module AlterMvc
  class BasicValidator < SimpleDelegator
    include ActiveModel::Validations

    alias :model :__getobj__


  private
    
    def errors
      model.errors
    end

  end
end