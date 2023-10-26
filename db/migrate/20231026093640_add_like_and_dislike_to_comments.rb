class AddLikeAndDislikeToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :like, :integer
    add_column :comments, :dislike, :integer
  end
end
