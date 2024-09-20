class TrainingResource < ApplicationRecord
  scope :search, ->(query) {
    if query.present?
      columns = [
        "author",
        "title",
        "short_description",
        "long_description"
      ]

      where(
        columns.map { |column| "#{column} LIKE :query" }.join(" OR "),
        query: "%#{query}%"
      )
    else
      all
    end
  }
end
