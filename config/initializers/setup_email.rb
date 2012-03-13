require 'development_mail_interceptor'

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => ENV['GMAIL_SMTP_USER'],
  :password             => ENV['GMAIL_SMTP_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = Rails.env.production? ? "tugowa.com" : "localhost:3000"
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
