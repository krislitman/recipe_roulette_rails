class CreateUserRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_recipes do |t|
      t.belongs_to :user
      t.belongs_to :recipe
      t.timestamps
    end
  end
end
