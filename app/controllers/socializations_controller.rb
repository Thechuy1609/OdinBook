class SocializationsController < ApplicationController
  before_action :load_socializable

  def follow
    current_user.follow!(@socializable)
    redirect_to root_path
  end

  def unfollow
    current_user.unfollow!(@socializable)
    redirect_to root_path 
  end

  def like
    current_user.like!(@socializable)
    redirect_to root_path 
  end

  def unlike
    current_user.unlike!(@socializable)
    redirect_to root_path 
  end

private
  def load_socializable
    @socializable =
      case
      when id = params[:comment_id] # Must be before :item_id, since it's nested under it.
        @community.comments.find(id)
      when id = params[:item_id]
        @community.items.find(id)
      when id = params[:user_id]
        User.find(id)
      when id = params[:id]
        Post.find_by_id(id)
      else
        raise ArgumentError, "Unsupported socializable model, params: " +
                             params.keys.inspect
      end
    raise ActiveRecord::RecordNotFound unless @socializable
  end  
end
