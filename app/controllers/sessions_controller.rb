class SessionsController < ApplicationController
  def new
    @session = @user
  end
  def create
    @user = User.find_by(username: params[:session][:username])
  if @user
    session[:user_id] = @user.id
    flash[:success] = "#{@user.name} Signed In Successfully"
    redirect_to root_path
  else
    flash.now[:alert] = 'User does not Exist, Sign up please!!'
    render :new
  end
end

end
