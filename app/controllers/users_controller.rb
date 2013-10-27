class UsersController < ApplicationController
  def create
    @user = User.create(user_params)

    if @user.persisted?
      redirect_to user_path(@user), :status => 303
    else
      render :json => {:errors => @user.errors}, :status => 422
    end
  end

  def show
    @user = User.where(:username => params[:id]).first!
    render :json => @user
  end

  def timeline
    user = User.where(:username => params[:id]).first!
    posts = Post.timeline(user).page(params[:after])
    next_page = timeline_user_path(user.username, :after => posts.last.id)
    render :json => {:posts => posts, :next => next_page}
  end

private

  def user_params
    prms = params.dup
    prms[:realname] = prms.delete(:real_name)
    prms.except(:controller, :action)
  end
end
