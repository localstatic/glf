class AddDestroyedAttributesToModels < ActiveRecord::Migration
  def change
    add_column :places, :destroyed_by, :datetime, default: nil, after: :added_by
    add_column :places, :destroyed_at, :datetime, default: nil, after: :destroyed_by

    add_column :poll_options, :destroyed_by, :datetime, default: nil, after: :place_id
    add_column :poll_options, :destroyed_at, :datetime, default: nil, after: :destroyed_by

    add_column :polls, :destroyed_by, :datetime, default: nil, after: :ended_at
    add_column :polls, :destroyed_at, :datetime, default: nil, after: :destroyed_by

    add_column :role_assignments, :destroyed_by, :datetime, default: nil, after: :role_id
    add_column :role_assignments, :destroyed_at, :datetime, default: nil, after: :destroyed_by

    add_column :roles, :destroyed_by, :datetime, default: nil, after: :machine_name
    add_column :roles, :destroyed_at, :datetime, default: nil, after: :destroyed_by

    add_column :users, :destroyed_by, :datetime, default: nil, after: :is_admin
    add_column :users, :destroyed_at, :datetime, default: nil, after: :destroyed_by

    add_column :votes, :destroyed_by, :datetime, default: nil, after: :user_id
    add_column :votes, :destroyed_at, :datetime, default: nil, after: :destroyed_by
  end
end
