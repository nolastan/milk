class User < ActiveRecord::Base
  attr_accessible :day, :habits, :hour, :token, :uid
  before_save :schedule

  def schedule
    # delete existing delayed_job if present
    Delayed::Job.find(self.delayed_job_id).destroy if self.delayed_job_id

    # next whatever day of week
    date = Date.today
    date += ((day - date.wday) % 7)

    # enqueue job
    dj = Delayed::Job.enqueue(TaskPost.new, 0, date)

    # save id of delayed job on radar record
    self.delayed_job_id = dj.id
  end
end
