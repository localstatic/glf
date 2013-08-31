class Poll < ActiveRecord::Base
  include ModelCommon

  attr_accessible :name, :ended_at

  validates_presence_of :name

  has_many :poll_options, inverse_of: :poll
  has_many :votes, through: :poll_options
  belongs_to :starter, inverse_of: :polls_started, class_name: "User", foreign_key: "started_by"

  def max_votes_per_user
    2
  end

  def max_votes_per_place
    1
  end

  def open?
    self.ended_at.nil?
  end
end
