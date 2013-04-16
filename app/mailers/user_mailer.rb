class UserMailer < ActionMailer::Base
 include SendGrid
 default :from => "no-reply@example.com"

  def password_reset(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
         :subject => 'Password Reset Notification')
  end
end
ActionMailer::Base.smtp_settings = {
  :address => "smtp.sendgrid.net",
  :port => 25,
  :domain => "mysite.com",
  :authentication => :plain,
  :user_name => "finfort@mysite.com",
  :password => "testtest"
}
