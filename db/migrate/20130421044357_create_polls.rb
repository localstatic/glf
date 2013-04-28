class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name
      t.integer :started_by
      t.datetime :ended_at

      t.timestamps
    end
  end
end
