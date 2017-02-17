class Event < ApplicationRecord
  belongs_to :user
  has_many :guestships
  has_many :users, through: :guestships
end
