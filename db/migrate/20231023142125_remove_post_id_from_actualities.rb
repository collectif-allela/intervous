class RemovePostIdFromActualities < ActiveRecord::Migration[7.0]
  def change
    remove_column :actualities, :post_id
  end
end
