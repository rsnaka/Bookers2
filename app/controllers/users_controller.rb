class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:image, :name, :introduction)
    @user = Uers.all
  end

  def edit
  end
end
