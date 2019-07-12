class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  

  
  def create
    like_post = Micropost.find(params[:micropost_id])
    current_user.like(like_post)
    flash[:success] = "お気に入り登録しました。"
    #redirect_to like_post
    redirect_back(fallback_location: root_path)

  end

  def destroy
    like_post = Micropost.find(params[:micropost_id])
    current_user.unlike(like_post)
    flash[:success] = "お気に入り解除しました。"
    # redirect_to like_post
    redirect_back(fallback_location: root_path)

  end
end
