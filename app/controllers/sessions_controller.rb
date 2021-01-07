class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    #if user exists and password is entered correctly
    if user && user.authenticate(params[:password])
      #Save user id inside the broswer cookie
      session[:user_id] = user.id
      redirect_to "/"
    else
      # If user login doesn't work
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
