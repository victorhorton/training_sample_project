require 'yaml'

tags_data = YAML.load(File.open(Rails.root.join("db/seeds_data/tags.yaml")))
tags_data.each do |row|
  Tag.create(row.to_hash)
end

training_resources_data = YAML.load(File.open(Rails.root.join("db/seeds_data/training_resources.yaml")))
training_resources_data.each_with_index do |row, idx|
  TrainingResource.create(row.to_hash)
end
