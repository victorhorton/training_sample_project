require 'yaml'

code_aesthetic_data = YAML.load(File.open(Rails.root.join("db/seeds_data/code_aesthetic/training_resources.yaml")))
code_aesthetic_data.each_with_index do |row, idx|
  training_resource = TrainingResource.create(
    title: row['title'],
    author: row['author'],
    short_description: row['short_description'],
    long_description: row['long_description'],
    featured_image: File.open(Rails.root.join("db/seeds_data/#{row['featured_image_path']}")),
    youtube_video_id: row['youtube_video_id'],
    duration: row['duration']
  )

  row['tag_names'].each do |tag|
    training_resource.tags << Tag.find_or_create_by!(name: tag.downcase)
  end
end

computerphile_data = YAML.load(File.open(Rails.root.join("db/seeds_data/computerphile/training_resources.yaml")))
computerphile_data.each_with_index do |row, idx|
  training_resource = TrainingResource.create(
    title: row['title'],
    author: row['author'],
    short_description: row['short_description'],
    long_description: row['long_description'],
    featured_image: File.open(Rails.root.join("db/seeds_data/#{row['featured_image_path']}")),
    youtube_video_id: row['youtube_video_id'],
    duration: row['duration']
  )

  row['tag_names'].each do |tag|
    training_resource.tags << Tag.find_or_create_by!(name: tag.downcase)
  end
end

users_data = YAML.load(File.open(Rails.root.join("db/seeds_data/users.yaml")))
users_data.each do |row|
  User.create!(row.to_hash)
end
