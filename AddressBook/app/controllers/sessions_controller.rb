class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])

    respond_to do |format|
      format.json { render json: @user.to_json }
      format.html {}
    end

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to people_path
    else
      flash.now[:notice] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
