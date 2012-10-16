class SessionsController < ApplicationController
  
  before_filter :authorize, only: [:destroy]
  
  def new
    
  end
  
  def create
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: t("flash_messages.sessions.logged_in")
    else
      flash.now.alert = t "flash_messages.sessions.bad_credentials"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t("flash_messages.sessions.logged_out")
  end
  
end