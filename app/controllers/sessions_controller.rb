class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id 
      flash[:notice] = "Signed in successfully!"
      redirect_to events_path
    else
      flash.now[:notice] = "Email or password is incorrect."
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "Signed out successfully!"
    redirect_to events_path
  end
end
