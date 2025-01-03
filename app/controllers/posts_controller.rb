class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end
  def home
    @posts = Post.includes(:user).order(created_at: :desc)
    @user =  current_user
    @followers =  @user.followers(User)
    @other_users = User.all.where("id != ?", current_user.id).where.not(id: current_user.followees(User).pluck(:id))
    @followees = @user.followees(User)
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
    if @post.save
      flash[:success] = 'Post successfully created'
      format.turbo_stream
    else
       flash[:error] = 'Something went wrong'
       format.html { render :new, status: :unprocessable_entity }

    end
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end


  def destroy
  @post = Post.find(params[:id])
  @post.destroy
    redirect_to root_path
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end