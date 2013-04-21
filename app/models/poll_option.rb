class PollOption < ActiveRecord::Base
  attr_accessible :place_id, :poll_id

  validates_presence_of :place_id
  validates_presence_of :poll_id

  belongs_to :poll, inverse_of: :poll_options
end
