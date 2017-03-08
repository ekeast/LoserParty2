require 'random_data'

10.times do
  User.create!(
    email: Random.email,
    password: Random.alphanumeric
  )
end

users = User.all

50.times do
  event = Event.create!(
    user: users.sample,
    name: Random.random_sentence,
    description: Random.paragraphs,
    date: Random.date,
    time: Random.time
  )
end
