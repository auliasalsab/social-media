class AddIndexOnLikesTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :likeable_type 
    add_column :likes, :likeable_type, :string
  end
    add_index :likes, [:likeable_type, :likeable_id]
end
