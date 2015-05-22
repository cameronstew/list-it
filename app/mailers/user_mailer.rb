class UserMailer < ApplicationMailer
  default from: 'cws322@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def email_list(recipient_name, recipient_email, list_id)
    @recipient = recipient_name
    @recipient_email = recipient_email
    @url = "http://localhost:3000/shopping/#{list_id}"
    mail(to: @recipient_email, subject: 'You have a new list!')
  end
end
