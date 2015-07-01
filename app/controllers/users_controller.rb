class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_user_role_param, only: [:new, :create]

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
    @type = params[:type]
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create        
    @user = User.new(user_params)
    if params[:user][:email].blank?
      flash.now.alert = 'Please provide email address' 
      #redirect_to '/users/new?type=' + params[:type], :alert => 'email cannot be blank' and return  

      @user = User.new
      render :new and return
    end  
    if params[:user][:password].blank?
      flash.now.alert = 'Please provide password'       
      render :new and return
    end      
    
    respond_to do |format|
      if @user.save
        user = login(@user.email, params[:user][:password])
        if !user.has_store && params[:type] == 'florist'   
          uri = '/store/new'    
          msg = 'Welcome to lefiores! lets setup your store!'
        else
          uri = root_url
          msg = 'Thank you for signing up!'
        end
        format.json { render :show, status: :created, location: @user }
        redirect_to uri, :alert => msg and return          
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #show product
  #GET /product/id
  def show_product
    product_id = params[:product_id]
    PRODUCT
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :type)
    end

    def check_user_role_param
      if(params[:type] == 'florist' || params[:type] == 'user')
        return true;
      else
        redirect_to root_url, alert: 'Invalid User Type Specified'
      end      
    end
end
