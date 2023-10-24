class RemoveNotNullConstraintFromNickname < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :nickname, :string, null: true
  end
end