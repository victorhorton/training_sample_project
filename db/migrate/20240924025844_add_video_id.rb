class AddVideoId < ActiveRecord::Migration[7.2]
  def change
    add_column :training_resources, :youtube_video_id, :string
  end
end
