class UsersController < ApplicationController
  def new
    @user = User.new
    render :new #sign up page
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
      redirect_to bands_url #redirect to which page?
    else
      flash.now[:error] = @user.errors.full_message
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def user_params
    params.require(:user).permit(:email_address, :password)
  end
end
