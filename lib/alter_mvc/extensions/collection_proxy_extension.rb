class ActiveRecord::Associations::CollectionProxy
  include AlterMvc::Extensions::CollectionRenderable

  def fetch_collection
    @association.instance_variable_get(:@proxy)
  end

end
