class Users::UsersController < ApplicationController

  before_action :set_current_user

  def show
  end

  def edit
  end

  def unsubscribe
  end

  def withdraw
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :age, :gender, :area, :email, :is_deleted)
  end

end
