module AlterMvc
  module Extensions
    # Base concern cantains overall behavior for rendering collection
    module CollectionRenderable
      # Collection self-rendering
      #
      # ==== Attributes
      #
      # * +as+ - name of rendering view
      # * +options+ - extra options passing to render
      #
      # ==== Examples
      #
      # # User has subscriptions and in the user cabinet they
      # # must be listed:
      # = user.subscriptions.rendering as: :row, options: {option1: :value1}
      def rendering(as: nil, options: {})
        collection_each.reduce(new_safe_buffer) do |output, (item, index)|
          output << item_rendering(item, as, options, index)
        end
      end

      protected

      def fetch_collection
        fail 'Not implemented!'
      end

      def collection_each
        fetch_collection.each.with_index
      end

      def new_safe_buffer
        ActiveSupport::SafeBuffer.new
      end

      def item_rendering(item, as, options, index)
        item.rendering(as: as, options: options.merge(index: index))
      end
    end
  end
end
