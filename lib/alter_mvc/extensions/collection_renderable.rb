module AlterMvc::Extensions::CollectionRenderable

  def rendering(as: nil, options: {})
    fetch_collection.each.with_index.inject(ActiveSupport::SafeBuffer.new) do |output, (element,index)|
      output << element.rendering(as: as, options: options.merge(index: index))
    end
  end

  def fetch_collection
    raise 'Not implemented!'
  end

end