class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      # Admins can do anything...
      can :manage, :all

      # ...except vote or nominate in ended polls
      cannot [:nominate, :add_options, :vote], Poll do |poll|
        !poll.ended_at.nil?
      end
    else
      can :read, :all
    end

    # Don't allow any user to destroy themselves
    cannot :destroy, User do |u|
      u.id == user.id
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
