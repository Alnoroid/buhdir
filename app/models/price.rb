class Price < ActiveRecord::Base
  belongs_to :event_price
  scope :titlesearch, -> (search) { where('title LIKE ? OR id LIKE ?', "%#{search}%","#{search}")}
  scope :catsearch, -> (cat_id) {where(price_category_id: cat_id)}
end