# == Schema Information
#
# Table name: ingredients
#
#  id          :integer          not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  recipe_id   :integer
#

class Ingredient < ApplicationRecord
end
