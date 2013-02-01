class TaskPost
  # attr_accessible :title, :body

  def perform
    puts "== NEW TASK POST =="
    tr = Taskrabbit::Api.new(user_token)
    task = tr.tasks.new({:named_price => 10, :name => 'Grocery Delivery'})
    task.save
  end

end
