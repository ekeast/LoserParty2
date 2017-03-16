class Event < ApplicationRecord
  belongs_to :user
  has_many :guestships, dependent: :destroy
  has_many :users, through: :guestships
  has_many :invites, dependent: :destroy
  validate :date_must_be_in_the_future

  def date_must_be_in_the_future
    if date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end
