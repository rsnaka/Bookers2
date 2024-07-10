class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end


  def after_sign_out_path_for(resource)
    about_path
  end

  def new
    @users = User.sign_in
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to users_path(@user.id)
    else
      render :new
    end
  end

  def create
    @users = User.sign_in
    if @user.save
      flash[:notice] = "Signed in succcessfully."
      redirect_to users_path(@user.id)
    else
      render :new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
