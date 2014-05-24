module AlterMvc::Extensions::CollectionRenderable

  def rendering(as: nil, with: nil)
    fetch_collection.each.with_index.inject(ActiveSupport::SafeBuffer.new) do |output, (element,index)|
      output << element.rendering(as: as, with: with, options: {index: index})
    end
  end

  def fetch_collection
    raise 'Not implemented!'
  end

end