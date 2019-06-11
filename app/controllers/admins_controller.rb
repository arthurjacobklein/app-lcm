class AdminsController < ApplicationController
  before_action :is_admin?
    def new

  	end

  	def create

  	end

  	def show

  	end


  	private

  	def is_admin?
       redirect_to root_path unless current_user.admin?
  	end

end
