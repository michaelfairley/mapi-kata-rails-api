class ApplicationController < ActionController::API
  serialization_scope nil

  def current_user
    authentication = request.headers["Authentication"]
    return nil  if authentication.nil?
    raw_token = authentication[/\AToken (.*)\z/, 1]
    return nil  if raw_token.nil?
    token = Token.find_by_value(raw_token)
    return nil  if token.nil?
    token.user
  end

  def require_user
    if current_user.nil?
      render :nothing => true, :status => 401
    end
  end

  def match_user
    if current_user.username != params[:user_id]
      render :nothing => true, :status => 403
    end
  end
end
