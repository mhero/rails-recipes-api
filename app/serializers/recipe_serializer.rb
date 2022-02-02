class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :recipe
  attributes :name, :image_url
  
  has_many :ingredients
  has_many :tags
end