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

  def after_sign_in_path_for(brand)
    brand_path(brand)
  end

end
