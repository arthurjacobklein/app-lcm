class ProductsController < ApplicationController
   before_action :authenticate_brand!


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
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'product was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end

  end
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'product was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'product was successfully destroyed.' }
      format.js
    end
  end


   private
   def product_params
      params.permit(:title, :description, :price, :reference, :quantity, :gender, product_images: [])
   end

end
