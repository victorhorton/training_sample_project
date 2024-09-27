class AddDurationToTraining < ActiveRecord::Migration[7.2]
  def change
    add_column :training_resources, :duration, :integer
  end
end
