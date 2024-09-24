require 'yaml'

code_aesthetic_data = YAML.load(File.open(Rails.root.join("db/seeds_data/code_aesthetic/training_resources.yaml")))
code_aesthetic_data.each_with_index do |row, idx|
  training_resource = TrainingResource.create(
    title: row['title'],
    author: row['author'],
    short_description: row['short_description'],
    long_description: row['long_description'],
    featured_image: File.open(Rails.root.join("db/seeds_data/#{row['featured_image_path']}")),
  )

  row['tag_names'].each do |tag|
    training_resource.tags << Tag.find_or_create_by!(name: tag.downcase)
  end
end

tags_data = YAML.load(File.open(Rails.root.join("db/seeds_data/tags.yaml")))
tags_data.each do |row|
  Tag.find_or_create_by!(row.to_hash)
end

training_resources_data = YAML.load(File.open(Rails.root.join("db/seeds_data/training_resources.yaml")))
training_resources_data.each_with_index do |row, idx|
  TrainingResource.create(row.to_hash)
end
