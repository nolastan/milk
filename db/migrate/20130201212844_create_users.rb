class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :token
      t.text :habits
      t.integer :day
      t.integer :hour

      t.timestamps
    end
  end
end
