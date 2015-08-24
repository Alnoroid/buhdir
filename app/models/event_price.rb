class EventPrice < ActiveRecord::Base
  has_many :artists
  has_many :prices
  has_many :places
end
