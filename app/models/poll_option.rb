class PollOption < ActiveRecord::Base
  include ModelCommon

  attr_accessible :place_id, :poll_id

  validates_presence_of :place_id
  validates_presence_of :poll_id

  belongs_to :poll, inverse_of: :poll_options
  belongs_to :place, inverse_of: :poll_options
  has_many :votes, inverse_of: :poll_option
end
