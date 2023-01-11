class CreatePhoneNumbers < ActiveRecord::Migration[6.1]
  def change
    create_table :phone_numbers do |t|
      t.integer :phone_number, null: false, limit: 8
      t.text :comment
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
