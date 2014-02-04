class ActiveRecord::AssociationRelation
  include AlterMvc::Extensions::CollectionRenderable

  def fetch_collection
    @association.instance_variable_get(:@proxy)
  end
end