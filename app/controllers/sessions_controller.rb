class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		if user = User.authenticate(params[:email], params[:password])
		   session[:current_user_id] = user.id
		   flash[:notice] = 'Success, you have logged in'
		   redirect_to root_url
		else
		   flash.now.alert = 'Sorry, username or password incorrect'
		   render action: 'new'
		end 
	end

	def destroy
		#complete this method
		session[:current_user_id] = nil
		flash[:notice] = 'Logged out'
		redirect_to root_url
	end
end
