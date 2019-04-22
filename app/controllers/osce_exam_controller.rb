class OsceExamController < ApplicationController
  authorize_resource
  def index
    @osces = Criterium.all
  end



end
