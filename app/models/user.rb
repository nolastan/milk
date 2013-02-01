class User < ActiveRecord::Base
  attr_accessible :day, :habits, :hour, :token, :uid
end
