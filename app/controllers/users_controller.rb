class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_user_logged_in?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    #complete this method
	@user = User.new(user_params)
	if @user.save
	  flash[:notice] = 'Success, User Created!'
	  redirect_to @user
        else
	  flash.now.alert = 'Error! User could not be created' 
          render 'new'
	end 
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #complete this method
       if @user.update(user_params)
          flash[:notice] = 'Success, User Updated!'
	  redirect_to @user
       else
          flash.now.alert = 'Error! Could not be Updated'
	  render 'new'
       end    
 end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #complete this method
	@user.destroy
	flash[:notice] = 'User deleted'
	redirect_to root:url
 end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end
end
