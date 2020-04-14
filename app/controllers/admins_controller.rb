class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = User.all
  end

  def update
    @user = User.find(params[:user][:id])

    if @user.update(user_params)
      redirect_to approvals_path, notice: "Updates"
    else
      redirect_to approvals_path, error: "There was a problem"
    end
  end

  private
    def user_params
      params.require(:user).permit(:approved)
    end
end