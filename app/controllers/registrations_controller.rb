class RegistrationsController < ApplicationController
	def new
	end

	def create
	    #complete this method
	    @user = User.new(params[:user])
	
	    if @user.save
		redirect_to root_path, :notice => "User Created Yay!"
	    else
		flash.now[:error] = 'Could not create User' 
	    end
	end	
end
