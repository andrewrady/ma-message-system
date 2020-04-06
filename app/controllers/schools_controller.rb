class SchoolsController < ApplicationController

  def show
    @school = User.friendly.find(params[:id])
  end

  def edit
    @school = User.friendly.find(params[:id])
  end

  def update
    @school = User.friendly.find(params[:id])

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
