require 'active_support/core_ext/string'

module AlterMvc::Concerns::DomainLogicable

  def domain_logic
    @_domain_logic ||= create_domain_logic
  end

  def method_missing(m, *args, &block)
    if domain_logic.respond_to? m
      domain_logic.send m, *args, &block
    else
      super
    end
  end

  private

  def create_domain_logic
    "#{self.class.name.demodulize}DomainLogic".constantize.new self
  end
end