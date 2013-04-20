class Place < ActiveRecord::Base
  attr_accessible :added_by, :name, :url

  belongs_to :user, foreign_key: "added_by", inverse_of: :places
end
