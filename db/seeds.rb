require 'random_data'

10.times do
  User.create!(
    email: Random.email,
    password: Random.alphanumeric
  )
end

users = User.all
