class UserMailer < ApplicationMailer
  helper :application
  
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to OdinBook')
  end
end