class ProductsController < ApplicationController


  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  	render new_product_path
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  	   @product.product_images.attach(params[:product_images])
		redirect_to (product_path(@product))
    else
    	render new_product_path
    end
   
  end

   private
   def product_params
      params.permit(:title, :description, :price, :reference, :quantity, :gender, product_images: [])
   end

end
