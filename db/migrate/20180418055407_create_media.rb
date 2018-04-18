class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :type
      t.json :images
      t.json :videos
      t.string :filter
      t.integer :user_id
    end
  end
end
