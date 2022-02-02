class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :recipe
  attributes :name
  
  has_many :ingredients
  has_many :tags
end