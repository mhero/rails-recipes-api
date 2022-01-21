class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :description
      t.timestamps
      t.references :recipe, foreign_key: true
    end
  end
end
