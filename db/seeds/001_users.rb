# Customers
print 'Creating 120 users with dogs...'
120.times.each do |i|
  # Customers
  user =
    User.create(
      name: Faker::Name.name + i.to_s,
      email: Faker::Internet.email,
      password: SecureRandom.base58(24),
    )

  print '.'
end

User.create!(name: 'Anakin Skywalker', email: 'anakin@example.com', role: :walker, password: 'ihatesand')

User.create!(
  name: 'Obi-Wan Kenobi',
  email: 'obi@example.com',
  role: :walker,
  manager: true,
  password: 'hellothere',
)
