class EventPrice < ActiveRecord::Base
  belongs_to :event

  #has_one :artist
  belongs_to :price
  #has_one :place
  accepts_nested_attributes_for :price
end
