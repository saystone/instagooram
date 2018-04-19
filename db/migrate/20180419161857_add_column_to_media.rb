class AddColumnToMedia < ActiveRecord::Migration[5.2]
  def change
    add_column :media, :shortcode, :string
  end
end
