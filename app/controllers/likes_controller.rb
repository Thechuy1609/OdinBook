class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = post.likes.build(user: current_user)

    if @like.save
      flash[:success] = 'Post liked!'
    else
      flash[:error] = 'Unable to like the post.'
    end

    redirect_to root_path
  end
end
