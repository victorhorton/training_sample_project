class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  rescue_from CanCan::AccessDenied do |exception|
    if exception.subject == TrainingResource
      redirect_to login_path, notice: "Please login"
    else
      redirect_to root_path, notice: exception.message
    end
  end
end
