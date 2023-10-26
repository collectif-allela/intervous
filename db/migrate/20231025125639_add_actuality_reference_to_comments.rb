class AddActualityReferenceToComments < ActiveRecord::Migration[7.0]
  def change
    add_index :comments, :actuality_id
    end
end
