class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :karma
      t.text :about
      t.string :email

      t.timestamps
    end
  end
end
