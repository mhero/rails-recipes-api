class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation_time
      t.string :number_of_comments
      t.string :external_id
      t.string :image_url
      t.string :total_time_formatted
      t.string :cook_time_formatted
      t.string :author_tip
      t.decimal :rating
      t.string :budget
      t.integer :number_of_servings
      t.string :difficulty

      t.timestamps
    end
  end
end
