require 'random_data'
require 'faker'
#
# first = User.find_or_create_by!(
#   email: "ekeast328@gmail.com",
#   password: "password"
# )

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

def rand_time(from, to=Time.now)
  Time.at(rand_in_range(from.to_f, to.to_f))
end

users = User.all

20.times do
  event = Event.create!(
    user: users.sample,
    name: Random.alphanumeric,
    description: Random.paragraphs,
    date: Random.date,
    time: Faker::Time.between(2.days.ago, Time.now, :all)
  )
end

events = Event.all

50.times do
  sender = users.sample
  recipient = users.sample
  event = events.sample
  unless (sender == recipient || Invite.where( event: event, email: recipient.email).first || Guestship.where(event: event, email: recipient.email).first)
    invite = Invite.create!(
      sender: sender,
      recipient: recipient,
      event: events.sample,
      email: recipient.email
    )
  end
end

20.times do
  user = users.sample
  event = events.sample
  unless (Invite.where(event: event, recipient: user).first || Guestship.where(user: user, event: event).first)
    guest = Guestship.create!(
      user: user,
      event: event,
      email: user.email
    )
  end
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Event.count} events created"
puts "#{Invite.count} invites created"
puts "#{Guestship.count} guestships created"
