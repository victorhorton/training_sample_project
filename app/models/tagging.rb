class Tagging < ApplicationRecord
  belongs_to :training_resource
  belongs_to :tag

  validates :training_resource_id, uniqueness: { scope: :tag_id }
end
