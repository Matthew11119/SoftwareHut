class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.user_type == "Admin"
      can :manage, :all
    elsif user.user_type == "Module Lead"
      can [:read, :edit, :update], [CriteriaResult]
      can [:ready_screen, :show, :completed_students], [StationResult]
      can [:index, :show], [Exam]
    elsif user.user_type == "Moderator"
      can [:read], [StationResult, CriteriaResult]
      can [:index], [Exam]
    end

  end
end
