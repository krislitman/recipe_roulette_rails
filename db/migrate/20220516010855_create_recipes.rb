class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :serves
      t.string :prep_time
      t.string :cooking_time
      t.string :ingredients
      t.string :instructions
      t.string :author

      t.timestamps
    end
  end
end
