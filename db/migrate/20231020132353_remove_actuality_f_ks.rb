class RemoveActualityFKs < ActiveRecord::Migration[7.0]
  change_table :actualities do |t|
    t.remove :post_id_id
  end
end
