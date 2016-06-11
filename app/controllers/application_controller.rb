class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_cart
    return @current_cart if @current_cart.present?

    if session[:cart_id].blank?
      cart = Cart.create!
      session[:cart_id] = cart.id
    else
      cart = Cart.find(session[:cart_id])
    end

    @current_cart = cart
  end
  helper_method :current_cart
end
