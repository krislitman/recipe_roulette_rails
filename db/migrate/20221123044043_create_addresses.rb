class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :line1
      t.string :line2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :currency

      t.timestamps
    end
  end
end
