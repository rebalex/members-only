class PostsController < ApplicationController
  before_action :require_login, only: [ :create, :new ]
  def index
    @posts = Post.all
    # code to grab all posts so they can be
    # displayed in the Index view (index.html.erb)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  def require_login
    if current_user
    # allow the user to perform the action they wanted
    else
    redirect_to new_user_registration_path
    end
  end
end
