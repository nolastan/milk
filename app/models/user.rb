class User < ActiveRecord::Base
  attr_accessible :day, :habits, :hour, :token, :uid, :delayed_job_id
  before_save :schedule

  def schedule
    # delete existing delayed_job if present
    Delayed::Job.find(self.delayed_job_id).destroy if self.delayed_job_id

    # next whatever day of week
    Time.zone = "Pacific Time (US & Canada)"
    date = DateTime.now.midnight
    date += ((day - date.wday) % 7)

    # time of day
    date = date.advance(:hours => hour, :minutes => 0)

    # enqueue job
    dj = TaskPost.delay(:run_at => date).new(:user => self)

    # save id of delayed job on radar record
    self.delayed_job_id = dj.id
  end
end
