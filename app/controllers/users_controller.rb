class UsersController < ApplicationController
  def new
    @user = User.new
  end



  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to log_in_url, :notice => "Account created successfully."
    else
      @user.password = ""
      @user.password_confirmation = ""
      render "new"
    end
  end

end
