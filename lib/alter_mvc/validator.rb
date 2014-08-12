require 'delegate'
require 'active_model'

module AlterMvc
  class Validator < SimpleDelegator
    include ActiveModel::Validations

    alias :model :__getobj__


  private
    
    def errors
      model.errors
    end

  end
end