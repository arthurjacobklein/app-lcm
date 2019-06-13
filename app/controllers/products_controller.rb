class ProductsController < ApplicationController
   before_action :authenticate_brand!, only: [:show, :edit, :update, :destroy]
   before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def show
  end

  def new
  	@product = Product.new
  end

  def create
  	@product = Product.new(product_params)
    @product.brand = current_brand
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'product was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
  end
  def edit
    @product.brand =Product.find(params[:current_brand_id])
  end

  end
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'product was successfully updated.' }
        format.js
      else
        format.html { render :edit }
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
   def set_product
     @product = Product.find(params[:id])
   end
   def product_params
      params.permit(:title, :description, :price, :reference, :quantity, :gender, product_images: [])
   end

end
