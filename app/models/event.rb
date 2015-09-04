class Event < ActiveRecord::Base

  has_many :event_curator_users
  accepts_nested_attributes_for :event_curator_users

  has_many :event_prices
  accepts_nested_attributes_for :event_prices

  belongs_to :client, inverse_of: :events
  accepts_nested_attributes_for :client



  scope :title_search, -> (search) { where('name LIKE ?', "%#{search}%")}
  scope :event_curator_users_filter, -> (curator) {joins(:event_curator_users).where(event_curator_users:{user_id:curator})}
  scope :state_filter, -> (state) {where(condition: state)}
  scope :date_search, -> (date) {where("MONTH(date_start) = ? AND YEAR(date_start) = ?",date.month,date.year)}
end