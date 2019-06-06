class ProductImagesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @product.product_images.attach(params[:product_images])
    redirect_to(product_path(@product))
  end
end
