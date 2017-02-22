json.extract! invite, :id, :sender_id, :recipient_id, :event_id, :email, :created_at, :updated_at
json.url invite_url(invite, format: :json)