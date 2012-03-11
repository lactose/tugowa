class UserMailer < ActionMailer::Base
  default :from => "admin@tugowa.com"
  def registration_confirmation(user)
    @user = user
    mail(:to => user.email, :subject => "Confirmation")
  end

end
