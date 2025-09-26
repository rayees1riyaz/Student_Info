class UsersController < ApplicationController
  def signup
    @user = User.new
  end

def create
  @user = User.new(user_params)
  if @user.save
    redirect_to index_path, notice: "Signup successfully! Registration Number: #{@user.registration_number}"
  else
    render :signup, status: :unprocessable_entity
  end
end

private

def user_params
 params.require(:user).permit(:name, :email, :dob, :password, :password_confirmation)
end
end
