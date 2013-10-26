class TokensController < ApplicationController
  def create
    user = User.authenticate_with_username_and_password(params[:username], params[:password])

    if user
      @token = user.tokens.create!
      render :json => @token
    else
      render :nothing => true, :status => 401
    end
  end
end
