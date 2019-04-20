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

	respond to do |format|
	  if @user.save
	    format.json {render :show, status :created, location @user}
	    flash[:notice] = 'Success, User Created!'
	  else
	    format.json {render json: @user.errors, status: :unprocesable_entity}
	    flash.now[:error] = 'Error! User could not be created' 
	  end
        end 
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #complete this method
    respond_to do |format|
       if @user.update(user_params)
          format.json {render :show, staus :ok, location: @user}
          flash[:notice] = 'Success, User Updated!'
       else
	  format.json {render json: @user.errors, status: :unprocessable_entity}
          flash.now[:error] = 'Error! Could not be Updated'
       end    
    end
 end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #complete this method
	@user.destroy
	respond_to do |format|
	  format.json {head :no_content}
	  flash[:notice] = 'User deleted'
	end 
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
