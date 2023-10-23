class RemoveActualityIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :actuality_id, :integer
    add_column :actualities,:post_id, :integer
    add_foreign_key :actualities, :posts
  end
end
