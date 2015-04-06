class StaticPagesController < ApplicationController
  def home
    @most_recent_post = Post.first
  end

  def about
  end

end
