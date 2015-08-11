class ContactCategory < ActiveRecord::Base
  has_many :contact_types
end
