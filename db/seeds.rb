require 'random_data'
require 'faker'
#


unless User.where(email: "ekeast328@gmail.com").first
  User.create!(
    email: "ekeast328@gmail.com",
    password: "password"
  )
end

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end


users = User.all

20.times do
  event = Event.create!(
    user: users.sample,
    name: Random.alphanumeric,
    description: Random.paragraphs,
    date: Faker::Date.forward(100),
    time: Faker::Time.between(2.days.ago, Time.now, :all),
    threshold: 100
  )
end

events = Event.all

50.times do
  event = events.sample
  sender = event.user
  recipient = users.sample

  unless (sender == recipient || Invite.where(recipient: recipient, event: event).first || Guestship.where(event: event, email: recipient.email).first)
    invite = Invite.create!(
      sender: sender,
      recipient: recipient,
      event: event,
      email: recipient.email,
      value: 10,
      accepted: false
    )
  end
end
#
# 20.times do
#   user = users.sample
#   event = events.sample
#   unless (Invite.where(event: event, recipient: user).first || Guestship.where(user: user, event: event).first)
#     guest = Guestship.create!(
#       user: user,
#       event: event,
#       email: user.email
#     )
#   end
# end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Event.count} events created"
puts "#{Invite.count} invites created"
puts "#{Guestship.count} guestships created"
