require 'active_support/core_ext/string'

module AlterMvc::Concerns::Querable

  def query
    @_query ||= create_query
  end

  def method_missing(m, *args, &block)
    if query.respond_to? m
      query.send m, *args, &block
    else
      super
    end
  end

  private

  def create_query
    "#{self.class.name.demodulize}Query".constantize.new self
  end
end