class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :url, default: ''
      t.integer :added_by

      t.timestamps
    end
  end
end
