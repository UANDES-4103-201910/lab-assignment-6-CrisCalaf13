class SessionsController < ApplicationController
	def new
	end

	def create
		#complete this method
		if user = User.authenticate(params[:email], params[:password])
		   session[:current_user_id] = user.id
		   redirect_to root_path, notice: "Success, you have logged in"
		else
		   flash.now[:error] = 'Sorry, username or password incorrect'
		   render 'edit'
		end 
	end

	def destroy
		#complete this method
		session[:current_user_id] = nil
		flash[:notice] = 'Logged out'
		redirect_to root_path
	end
end
