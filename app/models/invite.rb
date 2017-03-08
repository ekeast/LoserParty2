class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
  validate :cannot_have_guestship

    def cannot_have_guestship
      if (Guestship.where(email: email, event: event_id).first)
        errors.add(:email, "has been taken by a guest already attending")
      end
    end
end
