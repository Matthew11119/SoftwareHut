class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.user_type == "Admin"
      can :manage, :all
    elsif user.user_type == "Module Lead"
      can [:read, :edit, :update], [StationResult, CriteriaResult]
      can [:index], [Exam]
    elsif user.user_type == "Moderator"
      can [:read], [StationResult, CriteriaResult]
      can [:index], [Exam]
    end

  end
end
