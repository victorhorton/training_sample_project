class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.index :name, unique: true
      t.timestamps
    end

    create_join_table :tags, :training_resources do |t|
      t.index [ :tag_id, :training_resource_id ]
    end
  end
end
