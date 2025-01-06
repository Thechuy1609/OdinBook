class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    current_user.like(@post)
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("post_#{@post.id}_likes", partial: "likes/like_section", locals: { post: @post }),
          turbo_stream.replace("post_#{@post.id}_like_counter", partial: "likes/like_counter", locals: { post: @post })
        ]
      end
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    current_user.unlike(@post)
  
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.replace("post_#{@post.id}_likes", partial: "likes/like_section", locals: { post: @post }),
          turbo_stream.replace("post_#{@post.id}_like_counter", partial: "likes/like_counter", locals: { post: @post })
        ]
      end
    end
  end
end 
