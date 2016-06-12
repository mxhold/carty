class CartsController < ApplicationController
  def update
    product = Product.find(params[:cart][:product_id])
    current_cart.add_product(product)
    redirect_to :root
  end
end
