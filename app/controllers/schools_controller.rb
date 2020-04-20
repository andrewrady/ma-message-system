class SchoolsController < ApplicationController
  before_action :authenticate_user!, :except =>  [:index, :show]

  def index
    @schools = User.all
  end

  def show
    @school = User.friendly.find(params[:id])
  end

  def edit
    @school = User.friendly.find(params[:id])
    @link = Link.where(url: @school.slug).first

    if(current_user.id != @school.id)
      redirect_to school_path(@school)
    end
  end

  def update
    @school = User.friendly.find(params[:id])

    if(current_user.id != @school.id || current_user.approved === false)
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
