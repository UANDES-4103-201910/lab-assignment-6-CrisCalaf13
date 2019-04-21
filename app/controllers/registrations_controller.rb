class RegistrationsController < ApplicationController
	def new
	end

	def create
	    #complete this method
	    @user = User.new(params[:user])
	
	    if @user.save
		flash[:notice] = 'User Created Yay!'
		redirect_to root_url
	    else
		flash.now.alert = 'Could not create User'
		render 'new'
	    end
	end	
end
