require 'rails/generators/named_base'

module AlterMvc
  module Generators
    class Base < ::Rails::Generators::NamedBase

      def self.source_root
        @_rspec_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'alter_mvc', generator_name, 'templates'))
      end

    end
  end
end