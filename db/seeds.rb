10.times do
  Tag.create(
    name: Faker::Company.buzzword
  )
end

100.times do
  TrainingResource.create(
    author: Faker::Name.name,
    title: Faker::Company.catch_phrase,
    short_description: Faker::Lorem.sentence,
    long_description: Faker::Lorem.paragraph,
    tag_ids: Faker::Number.between(from: 1, to: 10)
  )
end
