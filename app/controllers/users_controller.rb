class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @books = @user.books
  end

  def show
    @user = current_user
    @books = @user.books

  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    @user = User.new(user_params)
    @user.user_id = current_user.id
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      @user = current_user
      @user = User.all
      render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
  end
end
