class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
  validate :already_invited
  validate :invite_yourself



    def already_invited
      if (Invite.where(recipient: recipient, event: event).first)
        errors.add(:recipient, "has already been invited")
      end
    end

    def invite_yourself
      if (recipient == event.user)
        errors.add(:recipient, "cannot be yourself")
      end
    end


end
