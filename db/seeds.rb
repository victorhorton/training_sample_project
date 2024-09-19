100.times do
  TrainingResource.create(
    author: Faker::Name.name,
    title: Faker::Company.catch_phrase,
    short_description: Faker::Lorem.sentence,
    long_description: Faker::Lorem.paragraph
  )
end
