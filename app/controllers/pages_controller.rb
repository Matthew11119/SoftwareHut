class PagesController < ApplicationController
  include ExamsHelper
  skip_authorization_check

  def home
    if can?(:manage, Exam)
      index_module_lead
    elsif can?(:edit, CriteriaResult)
      index_module_lead
    elsif can?(:read, CriteriaResult)
      index_moderator
    end
    @current_nav_identifier = :home
  end

end
