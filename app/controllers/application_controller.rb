class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  before_filter :protect, :except => [:preorder] unless Rails.env.development? or Rails.env.test?

  def protect
    @ips = ['127.0.0.1', '69.164.213.39'] 
    if not @ips.include? request.remote_ip
      # if the user is coming from an outside ip, redirect
      # redirect_to "/403.html"
      redirect_to new_preorder_path
      flash[:notice] = "The world isn't ready for tugowa yet. Be the first to know by giving us your email below!."
      return
    end
  end

end
