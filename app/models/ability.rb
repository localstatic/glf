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
      # Normal logged in users can...
      can [:create, :update], Place # create and update Places
      can [:create, :nominate, :add_options, :vote], Poll # Create, nominate and vote in Polls
    end

  end
end
