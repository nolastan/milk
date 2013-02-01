class CreateTaskPosts < ActiveRecord::Migration
  def change
    create_table :task_posts do |t|

      t.timestamps
    end
  end
end
