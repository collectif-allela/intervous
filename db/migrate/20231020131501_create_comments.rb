class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :thread_id
      t.integer :user_id
      t.text :body
      t.integer :status

      t.timestamps
    end
  end
end
