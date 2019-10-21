User.destroy_all
Company.destroy_all

5.times do
  Company.create(
    name: Faker::Company.name,
    international: Faker::Boolean.boolean,
    rating: rand(1.0..10.0).round(2)
  )
end

company_ids = Company.ids

1000.times do
  user = User.new(
    name: Faker::Name.name,
    gender: Faker::Gender.binary_type,
    age: (18..99).to_a.sample
  )

  user.insurance = Insurance.create(
    active: Faker::Boolean.boolean,
    business: Faker::Boolean.boolean,
    expiration: Faker::Date.between(from: 2.days.ago, to: 10.year.from_now),
    price: rand(100.0..1000.0).round(2),
    company_id: company_ids.sample
  )
  user.save
end
