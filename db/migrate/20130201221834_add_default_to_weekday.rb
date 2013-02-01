class AddDefaultToWeekday < ActiveRecord::Migration
  def up
    change_column :users, :day, :integer, :default => 1
  end

  def down
    change_column :users, :day, :integer, :default => nil
  end
end
