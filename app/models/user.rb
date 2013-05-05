class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  has_many :places, inverse_of: :user, foreign_key: "added_by"
  has_many :polls_started, inverse_of: :starter, class_name: "Poll", foreign_key: "started_by"
  has_many :votes, inverse_of: :voter
  has_many :role_assignments
  has_many :roles, through: :role_assignments

  def has_role?(role_sym)
    roles.any? { |r| r.machine_name.to_sym == role_sym }
  end

end
