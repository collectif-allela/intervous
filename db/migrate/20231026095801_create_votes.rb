class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :content_id
      t.integer :user_id
      t.string :content_type
      t.string :vote_type

      t.timestamps
    end
    add_index :votes, :content_id
    add_index :votes, :user_id
  end
end
