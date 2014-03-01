class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit, :destroy]
  before_action :admin_user,     only: [:create, :edit, :destroy]

  def index
    @user = current_user
    @posts = Posts.all.paginate(page: params[:page])
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to @post
    else
      render 'posts/new'
    end
  end

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end