class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
  validate :cannot_have_guestship
  validate :already_invited
  validate :invite_yourself



    def cannot_have_guestship
      if (Guestship.where(email: email, event: event_id).first)
        errors.add(:email, "has been taken by a guest already attending")
      end
    end

    def already_invited
      if (Invite.where(email: email, event: event).first)
        errors.add(:recipient, "has already been invited")
      end
    end

    def invite_yourself
      if (email == event.user.email)
        errors.add(:recipient, "cannot be yourself")
      end
    end


end
