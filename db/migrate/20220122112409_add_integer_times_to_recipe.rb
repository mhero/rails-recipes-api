class AddIntegerTimesToRecipe < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :total_time_seconds, :integer
    add_column :recipes, :cook_time_seconds, :integer
    add_column :recipes, :preparation_time_seconds, :integer
  end
end
