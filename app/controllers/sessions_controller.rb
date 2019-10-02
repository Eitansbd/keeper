class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to user
    else
      #use flash.now instead of flash when using with render and not redirect
      flash.now[:danger] = "Invalid email/password combination" 
      render 'new'
    end
  end
  
  def delete
    log_out
    redirect_to root_url
  end


end
