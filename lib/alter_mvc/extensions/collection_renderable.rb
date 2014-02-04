module AlterMvc::Extensions::CollectionRenderable

  def rendering(as: nil, with: nil)
    fetch_collection.inject(ActiveSupport::SafeBuffer.new) do |output, element|
      output << element.rendering(as: as, with: with)
    end
  end

  def fetch_collection
    raise 'Not implemented!'
  end

end