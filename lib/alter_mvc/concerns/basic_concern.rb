require 'active_support/core_ext/string'

module AlterMvc::Concerns::BasicConcern

  def build_concern(name)
    eval_string = "
      def #{name}
        @_#{name} ||= create_#{name}
      end
      def method_missing(m, *args, &block)
        if #{name}.respond_to? m
          #{name}.send m, *args, &block
        else
          super
        end
      end
      private
      def create_#{name}
        \"\#{self.class.name}#{name.to_s.classify}\".constantize.new self
      end
    "
    class_eval(eval_string)
  end

end