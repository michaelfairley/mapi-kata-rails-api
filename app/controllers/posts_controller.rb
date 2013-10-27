class PostsController < ApplicationController
  before_filter :require_user, :only => [:create, :destroy]
  before_filter :match_user, :only => [:create]

  def index
    user = User.where(:username => params[:user_id]).first!
    posts = user.posts.page(params[:after])
    next_page = user_posts_path(user.username, :after => posts.last.id)
    render :json => {:posts => posts, :next => next_page}
  end

  def create
    post = current_user.posts.create(post_params)
    redirect_to post_path(post), :status => 303
  end

  def show
    post = Post.find(params[:id])
    render :json => post
  end

  def destroy
    post = Post.find(params[:id])
    if post.author != current_user
      render :nothing => true, :status => 403
      return
    end
    post.destroy!
    render :nothing => true, :status => 204
  end

private

  def post_params
    params.except(:action, :controller)
  end
end
