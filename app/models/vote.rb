class Vote < ActiveRecord::Base
  include ModelCommon

  attr_accessible :poll_option_id, :user_id

  belongs_to :poll_option, inverse_of: :votes
  belongs_to :voter, inverse_of: :votes, class_name: "User"
end
