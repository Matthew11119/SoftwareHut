class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.user_type == "Admin"
      can :manage, :all
    elsif user.user_type == "Module Lead"
      can [:read, :edit, :update, :create], [CriteriaResult]
      can [:ready_screen, :show, :completed_students, :add_student, :search_new_student, :new_student, :new, :create], [StationResult]
      can [:index, :show], [Exam]
    elsif user.user_type == "Moderator"
      can [:read], [StationResult, CriteriaResult]
      can [:index], [Exam]
    end

  end
end
