class CreateTrainingResources < ActiveRecord::Migration[7.2]
  def change
    create_table :training_resources do |t|
      t.string :author
      t.string :title
      t.string :short_description
      t.string :long_description

      t.timestamps
    end
  end
end
