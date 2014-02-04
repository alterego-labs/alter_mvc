require 'active_support/core_ext/string'

module AlterMvc::Concerns::Presentable

  def presenter
    @_presenter ||= create_presenter
  end

  def method_missing(m, *args, &block)
    if presenter.respond_to? m
      presenter.send m, *args, &block
    else
      super
    end
  end

  private

  def create_presenter
    "#{self.class.name.demodulize}Presenter".constantize.new self
  end

end