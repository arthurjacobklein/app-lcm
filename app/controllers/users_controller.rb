class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.new
    @users = User.all

  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.js
      else
        format.html { render :new }
          format.js
      end
    end
  end

  def new
    @user = user.new
  end

  def show
  end

  def update
    respond_to do |format|
     if @user.update(post_params)
       format.html { redirect_to @user, notice: 'user was successfully updated.' }
       format.js
     else
       format.html { render :edit }
       format.js
     end
   end
  end

  def destroy
    @user.destroy
     respond_to do |format|
       format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
       format.js
     end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = user.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:first_name, :last_name, :company_name, :phone_number, :website)
    end


  end
