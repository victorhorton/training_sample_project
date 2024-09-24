class TrainingResource < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :tags, reject_if: :all_blank

  scope :search, ->(query) {
    if query.present?
      columns = {
        training_resources: [
          "author",
          "title",
          "short_description",
          "long_description"
        ],
        tags: [ "name" ]
      }

      pattern = columns.map { |table, columns|
        columns.map { |column| "#{table}.#{column} LIKE :query" }.join(" OR ")
      }.join(" OR ")

      eager_load(:tags).where(pattern, query: "%#{query}%")
    else
      eager_load(:tags).all
    end
  }
end
