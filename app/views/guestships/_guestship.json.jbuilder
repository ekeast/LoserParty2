json.extract! guestship, :id, :user_id, :event_id, :created_at, :updated_at
json.url guestship_url(guestship, format: :json)