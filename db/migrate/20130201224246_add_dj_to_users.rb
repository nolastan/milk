class AddDjToUsers < ActiveRecord::Migration
  def change
    add_column :users, :delayed_job_id, :integer
  end
end
