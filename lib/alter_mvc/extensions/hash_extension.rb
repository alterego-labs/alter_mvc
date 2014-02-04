class Hash
  include AlterMvc::Extensions::CollectionRenderable

  def fetch_collection
    values
  end

end