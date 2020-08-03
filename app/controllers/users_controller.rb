class UsersController < ApplicationController
  def new
    session_notice(:warning, 'Already logged in') if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @conversation = Conversation.where(sender_id: current_user, receiver_id: @user).first_or_create


  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def tweets
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation, :profile_picture)
  end
end
