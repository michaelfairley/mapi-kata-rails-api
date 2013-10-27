class FollowingController < ApplicationController
  before_filter :require_user, :only => [:create, :destroy]
  before_filter :match_user, :only => [:create, :destroy]

  def create
    follower = User.where(:username => params[:user_id]).first!
    followee = User.where(:username => params[:id]).first!

    Following.create!(:follower => follower, :followee => followee)  rescue ActiveRecord::RecordNotUnique

    render :nothing => true, :status => 201
  end

  def destroy
    follower = User.where(:username => params[:user_id]).first!
    followee = User.where(:username => params[:id]).first!

    following = Following.where(:follower => follower, :followee => followee).first!
    following.destroy!

    render :nothing => true, :status => 204
  end
end
