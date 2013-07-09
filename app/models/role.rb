class Role < ActiveRecord::Base
  include ModelCommon

  attr_accessible :machine_name, :name
end
