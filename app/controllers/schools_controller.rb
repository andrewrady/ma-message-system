class SchoolsController < ApplicationController
  before_action :authenticate_user!, :except =>  [:show]

  def show
    @school = User.friendly.find(params[:id])
  end

  def edit
    @school = User.friendly.find(params[:id])

    if(current_user.id != @school.id)
      redirect_to school_path(@school)
    end
  end

  def update
    @school = User.friendly.find(params[:id])

    if(current_user.id != @school.id)
      redirect_to school_path(@school)
    end

    if @school.update(school_params)
      redirect_to school_path(@school)
    else
      render 'edit'
    end
  end

  private
    def school_params
      params.require(:user).permit(:content)
    end
end
