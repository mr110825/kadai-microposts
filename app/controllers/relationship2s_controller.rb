class Relationship2sController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'お気に入りを追加しました。'
    redirect_to :back
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.dislike(micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to user
  end
end
