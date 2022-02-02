class IngredientSerializer
  include FastJsonapi::ObjectSerializer
  set_type :ingredient
  
  attributes :id, :description
  belongs_to :recipe, record_type: :recipe
end