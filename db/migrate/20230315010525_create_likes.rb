class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false 
      # t.references :likeable, polymorphic: true, null: false
      t.bigint :likeable_id
      t.bigint :likeable_type

      t.timestamps
    end
  end
end