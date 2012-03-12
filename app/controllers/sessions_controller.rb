class SessionsController < ApplicationController

  def new
    @title = "Login"
    render :new
  end
  def create
    user = User.authenticate(params[:session][:email],
                           params[:session][:password])
    if user.nil?
      # Create an error message and re-render the signin form.
      flash.now[:error] = "Invalid credentials."
      @title = "Login"
      render :new
    else
      # Sign the user in and redirect to the user's show page.
      if sign_in user
        flash.now[:success] = "Successful login."
        redirect_back_or user
      else
        flash.now[:error] = "You need to confirm your account."
        @title = "Login"
        render :new
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
