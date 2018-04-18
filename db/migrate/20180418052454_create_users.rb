class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :full_name
      t.string :profile_picture
      t.string :bio
      t.string :website
    end
  end
end
