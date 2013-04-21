class Poll < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :poll_options, inverse_of: :poll
  has_one :user, foreign_key: "started_by", inverse_of: :polls
end
