class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.bigint :user_id
      t.bigint :post_id
      t.bigint :parent_id

      t.timestamps
    end
  end
end
