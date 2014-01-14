class SessionsController < ApplicationController
  layout "sessions_layout"
  
  def new
    render 'new'
  end
  
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "You have successfully logged in!"
      redirect_to root_url
    else
      flash.now[:error] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
end
