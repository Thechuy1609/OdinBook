class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @followers =  @user.followers(User).count
    @followees = @user.followees(User).count
  end
end
