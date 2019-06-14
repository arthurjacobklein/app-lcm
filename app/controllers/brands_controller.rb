class BrandsController < ApplicationController
  before_action :authenticate_brand!, only: [:show, :edit, :update, :destroy]
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def show
    @brand.products = current_brand.products
  end

  def update
    respond_to do |format|
     if @brand.update(brand_params)
       format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
       format.js
     else
       format.html { render :edit }
       format.js
     end
   end
  end

  def destroy
    @brand.destroy
     respond_to do |format|
       format.html { redirect_to brands_url, notice: 'Brand was successfully destroyed.' }
       format.js
     end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = current_brand
    end
    def brand_params
      params.require(:brand).permit(:first_name, :last_name, :company_name, :phone_number, :website)
    end


end
