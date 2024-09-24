class RenameJoinToTaggings < ActiveRecord::Migration[7.2]
  def change
    rename_table :tags_training_resources, :taggings
  end
end
