class ProfilePicturesController < ApplicationController
	def create
    @user = User.find(params[:user_id])
    @user.profilepicture.attach(params[:profilepicture])
    redirect_to(user_path(@user))
  end
end
