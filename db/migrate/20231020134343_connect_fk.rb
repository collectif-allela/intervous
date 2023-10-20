class ConnectFk < ActiveRecord::Migration[7.0]

  def change
    add_column :posts, :actuality_id, :integer
    add_column :comments, :actuality_id, :integer
    add_column :comments, :user_id, :integer
    
    add_foreign_key :posts, :actualities, column: :actuality_id
    add_foreign_key :comments, :actualities, column: :actuality_id
  end
end
