class User < ActiveRecord::Base
  attr_accessible :day, :habits, :hour, :token, :uid
  after_save :schedule

  def schedule
    # next whatever day of week
    date = Date.today
    date += ((day - date.wday) % 7)
    Delayed::Job.enqueue(TaskPost.new, 0, date)
  end
end
