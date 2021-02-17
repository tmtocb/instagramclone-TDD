class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[edit update]

  def show
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.save
      redirect_to(user_path(@user))
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :website,
                               :bio, :email, :phone, :gender)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
