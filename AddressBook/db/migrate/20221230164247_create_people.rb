class CreatePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :people do |t|
      t.string :salutation
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.integer :ssn
      t.date :birth_date
      t.text :comment

      t.timestamps
    end
  end
end
