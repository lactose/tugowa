class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :protect unless Rails.env.development?

  def protect
    @ips = ['127.0.0.1', '69.164.213.39'] 
    if not @ips.include? request.remote_ip
      # Check for your subnet stuff here, for example
      # if not request.remote_ip.include?('127.0,0')
      render :text => "You are unauthorized"
      return
    end
  end

end
