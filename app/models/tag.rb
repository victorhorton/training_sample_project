class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :training_resources, through: :taggings

  before_save :downcase_name

  scope :most_popular, -> {
    joins(:training_resources)
    .group(:id)
    .order(Arel.sql("COUNT(training_resources.id) DESC"))
    .limit(5)
  }

  def titlized_name
    name.titleize
  end

  private

  def downcase_name
    self.name = self.name.downcase
  end
end
