module UserHelper
  def user_signed_in?
    session[:username].present?
  end

  def current_user
    User.find_by_username(session[:username])
  end
end