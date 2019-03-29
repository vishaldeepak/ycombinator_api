class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :url
      t.text :content
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
