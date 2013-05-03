class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    unless user.id.nil?
      can :manage, :all
      can :vote, Poll
    end

    can :read, :all
  end
end
