class UpdateTypeDataFromColomLikeFromPostTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :likeable_type 
    add_column :likes, :likeable_type, :string
  end
end
