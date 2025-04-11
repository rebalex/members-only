class UsersController < ApplicationController
  before_action :require_login, only: [ :edit, :update, :destroy ]
  def index
    @users = User.all
    # code to grab all posts so they can be
    # displayed in the Index view (index.html.erb)
  end

  def show
    # code to grab the proper Post so it can be
    # displayed in the Show view (show.html.erb)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # code to find the post we want and send the
    # user to the Edit view for it (edit.html.erb), which has a
    # form for editing the post
  end

  def update
    # code to figure out which post we're trying to update, then
    # actually update the attributes of that post. Once that's
    # done, redirect us to somewhere like the Show page for that
    # post
  end

  def destroy
    # code to find the post we're referring to and
    # destroy it.  Once that's done, redirect us to somewhere fun.
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email)
  end

  def require_login
    if current_user
    else
    redirect_to new_user_path
    end
  end
end
