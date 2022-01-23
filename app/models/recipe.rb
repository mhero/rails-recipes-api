# frozen_string_literal: true

# == Schema Information
#
# Table name: recipes
#
#  id                       :integer          not null, primary key
#  name                     :string
#  preparation_time         :string
#  number_of_comments       :string
#  external_id              :string
#  image_url                :string
#  total_time_formatted     :string
#  cook_time_formatted      :string
#  author_tip               :string
#  rating                   :decimal(, )
#  budget                   :string
#  number_of_servings       :integer
#  difficulty               :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  user_id                  :integer          not null
#  total_time_seconds       :integer
#  cook_time_seconds        :integer
#  preparation_time_seconds :integer
#

class Recipe < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :tasty_search, associated_against: {
    ingredients: [:description],
    tags: [:description],
    user: :handle
  }, using: { tsearch: { dictionary: 'french' } }

  has_many :ingredients, dependent: :destroy
  has_many :tags, dependent: :destroy
  belongs_to :user
end
