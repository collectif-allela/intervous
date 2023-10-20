class RenameThreadToActuality < ActiveRecord::Migration[7.0]
  change_table :comments do |t|
    t.rename :thread_id, :actuality_id
  end
end
