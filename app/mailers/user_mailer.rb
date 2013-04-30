# Send password reset notification
# path: app/mailers/user_mailer.rb
#http://www.ruby-doc.org/gems/docs/d/dcu-devise-1.0.7/Devise/Models/Recoverable.html
#http://railscasts.com/episodes/274-remember-me-reset-password?view=asciicast
class UserMailer < ActionMailer::Base
  default :from => "no-reply@example.com"

  def password_reset(user, password)
    @user = user
    @password = password
    mail(:to => user.email,
         :subject => 'Password Reset Notification')
  end
end
