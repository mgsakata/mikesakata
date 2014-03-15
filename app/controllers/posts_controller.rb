class PostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit, :destroy]
  before_action :admin_user,     only: [:create, :edit, :destroy]

  def index
    @user = current_user
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def edit
    @user = current_user
    @post = Post.find(params[:id])
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

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to posts_url
  end

  private

    def post_params
      params.require(:post).permit(:content,:title,:tags)
    end
end