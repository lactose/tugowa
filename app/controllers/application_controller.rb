class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :protect unless Rails.env.development? or Rails.env.test?

  def protect
    @ips = ['127.0.0.1', '69.164.213.39'] 
    if not @ips.include? request.remote_ip
      # if the user is coming from an outside ip, redirect
      redirect_to "/403.html"
      return
    end
  end

end
