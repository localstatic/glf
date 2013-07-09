class Place < ActiveRecord::Base
  include ModelCommon

  attr_accessible :added_by, :name, :url, :address, :city, :state, :zipcode, :disabled

  belongs_to :user, inverse_of: :places, foreign_key: "added_by"
  has_many :poll_options, inverse_of: :place
end
