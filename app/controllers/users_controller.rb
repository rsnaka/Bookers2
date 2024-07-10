class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:image, :name, :introduction)
    @user = Uers.all
  end

  def edit
    @user = User.find(params[:id])
    is_matching_login_user
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
    @user = User.new(book_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :new
    end
    is_matching_login_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :opinion)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
  end
end
