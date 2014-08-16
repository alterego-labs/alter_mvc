module AlterMvc
  module Helpers
    class MethodDispatcher
      
      DEFAULT_CALLING = {
        :"render_" => :renderer
      }

      attr_reader :concern, :model

      def initialize(concern, model)
        @concern, @model = concern, model
      end

      def call(method, *args)
        if is_default_calling?(method)
          perform_default_action method, *args
        else
          model.send method, *args
        end
      end

    private

      def is_default_calling?(method)
        !fetch_default_calling(method).nil?
      end

      def fetch_default_calling(method)
        DEFAULT_CALLING.keys.select { |prefix| check_prefix(prefix, method) }.first
      end

      def check_prefix(prefix, method)
        method.to_s.start_with? prefix.to_s
      end

      def extract_suffix(method)
        method.to_s.gsub(/^[a-z0-9]+\_/, "").to_sym
      end

      def extract_concern(method)
        prefix = fetch_default_calling(method)
        DEFAULT_CALLING[prefix]
      end

      def perform_default_action(method, *args)
        concern_name = extract_concern(method)
        c = model.send concern_name
        c.send :default_action, extract_suffix(method), *args
      end

    end
  end
end