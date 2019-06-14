class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def after_sign_in_path_for(user)
    products_path
  end

  before_action :configure_permitted_parameters, if:  :devise_controller?


protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :company_name, :phone_number, :website])

  end

end
