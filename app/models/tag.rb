# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  description :string
#  recipe_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tag < ApplicationRecord
end
