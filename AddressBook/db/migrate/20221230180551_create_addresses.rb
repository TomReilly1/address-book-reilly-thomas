class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :town, null: false
      t.integer :zip, null: false
      t.string :state
      t.string :country, null: false
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
