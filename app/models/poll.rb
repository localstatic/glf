class Poll < ActiveRecord::Base
  attr_accessible :name, :ended_at

  validates_presence_of :name

  has_many :poll_options, inverse_of: :poll
  belongs_to :starter, inverse_of: :polls_started, class_name: "User", foreign_key: "started_by"
end
