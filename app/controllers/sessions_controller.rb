class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to applications_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def student_login
  end

  def student_create
    user = User.find_by(registration_number: params[:registration_number])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to index_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid Registration Number or Password"
      render :student_login
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
