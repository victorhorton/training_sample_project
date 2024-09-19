json.extract! training_resource, :id, :author, :title, :short_description, :long_description, :created_at, :updated_at
json.url training_resource_url(training_resource, format: :json)
