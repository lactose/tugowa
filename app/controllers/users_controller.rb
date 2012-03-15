class UsersController < ApplicationController
  
  before_filter :authenticate, :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  respond_to :html, :json, :xml

  def index
    @users = User.all

    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name

    respond_with @user
  end

  def new
    @user = User.new
    @title = "Register"

    respond_with @user
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        format.html { 
          redirect_to root_path, :notice => "An email has been sent to confirm your account." 
        }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        @title = "Register"
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Profile updated.' }
        format.json { head :no_content }
      else
        @title = "Edit"
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User destroyed."

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # CONFIRM /users/dsaj3i12i123
  def confirm
    @user = User.confirm(params[:email], params[:confirm_code])
    
    if @user
      respond_to do |format|
        format.html { 
          flash[:notice] = 'Almost there! Just complete your profile to finish confirming.' 
        }
        format.json { head :no_content }
      end
    else
      redirect_to login_path, :error => "The confirmation code was incorrect."
    end
   
  end

  def verify
    @user = User.find(params[:id])
    sign_out

    respond_to do |format|
      if @user.update_attributes(params[:user])
        @user.confirmed = true
        @user.save
        sign_in @user
        format.html { redirect_to @user, notice: 'Profile updated.' }
        format.json { head :no_content }
      else
        @title = "Edit"
        format.html { render action: "confirm" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end


end
