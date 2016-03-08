module SessionsHelper
  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def authorized(creator_id)
    current_user.id == creator_id
  end
end
