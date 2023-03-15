class UpdateColomTypeFromPostTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :type, :post_type
  end
end
