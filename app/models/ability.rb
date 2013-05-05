class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
    end

    unless user.id.nil?
      can :vote, Poll
      can [:create, :update], Place
      can [:nominate, :add_options], Poll
    end

  end
end
