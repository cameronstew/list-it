class ListMailer < ApplicationMailer
  default from: 'cws322@gmail.com'

  def email_list(recipient_name, recipient_email, list_id)
    @recipient = recipient_name
    @recipient_email = recipient_email
    @url = "http://insta-list.herokuapp.com/shopping/#{list_id}"
    mail(to: @recipient_email, subject: 'You have a new list!')
  end

  def skipped_items_email(recipient_name, recipient_email, skipped_items)
    @recipient = recipient_name
    @recipient_email = recipient_email
    @skipped_items = skipped_items
    mail(to: @recipient_email, subject: 'Your list has been shopped!')
  end

end
