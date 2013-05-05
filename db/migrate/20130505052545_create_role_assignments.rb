class CreateRoleAssignments < ActiveRecord::Migration
  def change
    create_table :role_assignments do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
  end
end
