# == Schema Information
#
# Table name: recipes
#
#  id                   :integer          not null, primary key
#  name                 :string
#  preparation_time     :string
#  number_of_comments   :string
#  external_id          :string
#  image_url            :string
#  total_time_formatted :string
#  cook_time_formatted  :string
#  author_tip           :string
#  rating               :decimal(, )
#  budget               :string
#  number_of_servings   :integer
#  difficulty           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :user
  
end
