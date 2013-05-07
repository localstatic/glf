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
      ## Normal logged in users can...

      # Create and update Places
      can [:create, :update], Place

      # Create, nominate and vote in Polls
      can [:create, :nominate, :add_options, :vote], Poll, ended_at: nil
    end

  end
end
