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

  unless (sender == recipient || Invite.where(recipient: recipient, event: event).first)
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

100.times do
  event = events.sample
  sender = event.user
  recipient = User.where(email: "ekeast328@gmail.com").first

  unless (sender == recipient || Invite.where(recipient: recipient, event: event).first)
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


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Event.count} events created"
puts "#{Invite.count} invites created"
