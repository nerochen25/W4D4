class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:email_address],
      params[:user][:password]
    )

    if user.nil?
      flash.now[:error] = "Incorrect email address/password"
      render :new
    else
      login_user!(user)
      redirect_to bands_url(user)
    end
  end

  def new
    render :new
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end


end
