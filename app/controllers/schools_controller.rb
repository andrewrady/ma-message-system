class SchoolsController < ApplicationController

  def show
    @school = User.friendly.find(params[:id])
  end
end
