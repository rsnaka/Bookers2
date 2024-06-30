class UsersController < ApplicationController
  def show_params
    params.require(:user).permit(:image, :name, :introduction)
    @user = Uers.all
  end

  def edit
  end
end
