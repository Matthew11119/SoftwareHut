class OsceExamController < ApplicationController

  def index
    @osces = Criterium.all
  end



end
