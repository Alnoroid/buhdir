class EventPrice < ActiveRecord::Base
  belongs_to :event

  #has_one :artist
  has_one :price
  #has_one :place
end
