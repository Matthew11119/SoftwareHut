class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    if user.user_type == "Admin"
      can :manage, :all
    elsif user.user_type == "Module Lead"
      can [:read, :edit, :update], [CriteriaResult]
      can [:ready_screen, :show, :completed_students, :add_student, :search_new_student, :new_student, :new], [StationResult]
      can [:index, :show], [Exam]
      can [:read, :results, :exam_results, :student_result], [StationResult, CriteriaResult, Exam, Station, Criterium, Answer]
    elsif user.user_type == "Moderator"
      can [:read, :student_result], [StationResult, CriteriaResult, Exam, Station, Criterium, Answer]
    end

  end
end
