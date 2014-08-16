require 'active_support/core_ext/string/inflections'

module AlterMvc
  module Helpers
    class RenderParameters
      
      attr_reader :model

      def initialize(model)
        @model = model
      end

      def gen_custom(name, options = {})
        render_params custom_view_path(name), options
      end

      def gen_self(name, options = {})
        render_params self_view_path(name), options
      end

    private

      def resource_name
        model.class.name.underscore.gsub('_presenter', '')
      end

      def plural_resource_name
        resource_name.pluralize
      end

      def custom_view_namespace
        "shared/#{resource_name}"
      end

      def custom_view_path(name)
        "#{custom_view_namespace}/#{name}"
      end

      def self_view_path(name)
        "#{plural_resource_name}/render/#{name}"
      end

      def render_params(partial_name, options = {})
        {partial: partial_name}.merge opts_with_resource(options)
      end

      def opts_with_resource(options = {})
        {locals: { :"#{resource_name}" => model }.merge(options)}
      end

    end
  end
end