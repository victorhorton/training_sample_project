class TrainingResource < ApplicationRecord
  has_one_attached :featured_image

  has_many :taggings, dependent: :delete_all
  has_many :tags, through: :taggings

  validates :author, presence: true
  validates :title, presence: true
  validates :short_description, presence: true
  validates :long_description, presence: true
  validates :youtube_video_id, presence: true
  validates :duration, presence: true

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

  scope :with_featured_image, -> { includes(featured_image_attachment: :blob) }
end
