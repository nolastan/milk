class Item < ActiveRecord::Base
  attr_accessible :delivered_at, :name, :user_id
end
