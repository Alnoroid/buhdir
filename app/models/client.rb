class Client < ActiveRecord::Base
  has_many :events, inverse_of: :client
  #validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => 'Неверный формат элетронной почты', :allow_blank => true, :allow_nil => true
end