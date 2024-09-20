class Tag < ApplicationRecord
  has_and_belongs_to_many :training_resources
  before_save :downcase_name

  private

  def downcase_name
    self.name = self.name.downcase
  end
end
