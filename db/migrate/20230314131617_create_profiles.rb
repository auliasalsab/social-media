class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :phone_number
      t.date :dob
      t.integer :gender
      t.string :bio

      t.timestamps
    end
  end
end
