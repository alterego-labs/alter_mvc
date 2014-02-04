class ActiveRecord::Relation
  include AlterMvc::Extensions::CollectionRenderable

  def fetch_collection
    self.to_a
  end

end