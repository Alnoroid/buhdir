class Price < ActiveRecord::Base

scope :titlesearch, -> (search) { where('title LIKE ?', "%#{search}%")}
#  scope :titlesearch, -> (search) {where(title: 'Ди-джей')}
scope :test, -> {where(title: 'Ди-джей')}

end