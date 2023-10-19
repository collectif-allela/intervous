class CreateActualities < ActiveRecord::Migration[7.0]
  def change
    create_table :actualities do |t|
      t.string :title
      t.references :post_id, null: false, foreign_key: true
      t.text :video_url
      t.text :body
      t.text :summary
      t.string :tag

      t.timestamps
    end
  end
end
