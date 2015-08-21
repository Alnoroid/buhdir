class EventCuratorUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end