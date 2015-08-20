class Price < ActiveRecord::Base

scope :titlesearch, -> (search) { where('title LIKE ? OR id LIKE ?', "%#{search}%","#{search}")}

end