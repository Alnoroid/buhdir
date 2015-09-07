class Price < ActiveRecord::Base
  has_many :event_prices
  scope :titlesearch, -> (search) { where('title LIKE ? OR id LIKE ?', "%#{search}%","#{search}")}
  scope :catsearch, -> (cat_id) {where('price_category_id = ?', cat_id ).order(:id)}

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => ":rails_root/app/assets/images/price/logo1.png", :path => ":rails_root/app/assets/images/price/:id/:style/:filename", :url => ":rails_root/app/assets/images/price/:id/:style/:filename"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  #MONTH(date_start) = ? AND YEAR(date_start) = ?
end