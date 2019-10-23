class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user

  def current_user
<<<<<<< HEAD
    @user = User.find_by(id: session[:user_id])
=======
    @user = (User.find_by(id: session[:user_id]) || User.new)
    #YO SERGIO SAYS USER.NEW IS WRONG AND U SHOULD DELETE IT
>>>>>>> 02ad551f4c2f8ddaa6b8659c654e966857671ab8
  end

  def logged_in?
    current_user.id != nil
    # !!current_user
  end

  def require_logged_in
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in?
  end
end
