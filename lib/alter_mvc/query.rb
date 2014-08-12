require 'delegate'

module AlterMvc
  class Query < SimpleDelegator
    include AlterMvc::Helpers::ModelConcern

    def self.method_missing(meth, *args, &blk)
      self.new(default_base).send meth, *args
    end

  end
end