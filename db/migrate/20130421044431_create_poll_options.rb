class CreatePollOptions < ActiveRecord::Migration
  def change
    create_table :poll_options do |t|
      t.integer :poll_id
      t.integer :place_id

      t.timestamps
    end
  end
end
