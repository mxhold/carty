class CartsController < ApplicationController
  def update
    product = Product.find(cart_params[:product_id])
    cart_params[:quantity].to_i.times do
      current_cart.add_product(product)
    end
    redirect_to :root
  end

  def checkout
    current_cart.checkout
    flash[:notice] = "Purchase complete"
    redirect_to :root
  end

  def cart_params
    params[:cart].permit(:product_id, :quantity)
  end
end
