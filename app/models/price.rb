class Price < ActiveRecord::Base
  belongs_to :event_price
scope :titlesearch, -> (search) { where('title LIKE ? OR id LIKE ?', "%#{search}%","#{search}")}

end