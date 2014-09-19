require 'active_support/core_ext/string/inflections'
require 'i18n'

module AlterMvc
  module Helpers
    module Validator
      ##
      # Decides how to construct error messages in validator
      #
      class ErrorMessageConstructor
        attr_reader :klass, :message

        def initialize(klass, message)
          @klass = klass
          @message = message
        end

        def construct
          use_locales? ? fetch_localized_message : message
        end

        private

        def use_locales?
          message.is_a? Symbol
        end

        def root_namespace
          klass.name.underscore
        end

        def locale_key
          "#{root_namespace}.errors.#{message}"
        end

        def fetch_localized_message
          I18n.t locale_key
        end
      end
    end
  end
end
