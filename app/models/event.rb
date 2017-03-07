class Event < ApplicationRecord
  belongs_to :user
  has_many :guestships, dependent: :destroy
  has_many :users, through: :guestships
  has_many :invites, dependent: :destroy
end
