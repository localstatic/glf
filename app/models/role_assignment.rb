class RoleAssignment < ActiveRecord::Base
  include ModelCommon

  attr_accessible :role_id, :user_id
  
  belongs_to :role
  belongs_to :user
end
