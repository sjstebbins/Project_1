class UserMailer < ActionMailer::Base
  default from: 'notifications@tucan.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to Tucan')
  end

  def note_email(user, entry)
    @user = user
    @entry = entry
    @url  = 'http://localhost:3000/login'
    mail(to: @user, subject: 'Welcome to Tucan')
  end
end
