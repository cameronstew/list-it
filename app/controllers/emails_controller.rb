class EmailsController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @email = Email.new
  end

  def create
    @email = Email.create(email_params)
    @email.list_id = params[:list_id]

    @list.author = @email.sender_name
    @list.author_email = @email.sender_email
    @list.save

    if @email.save
      ListMailer.email_list(@email.recipient_name, @email.recipient_email, @email.list_id).deliver_now
    end
    redirect_to lists_path
  end

  def skipped_items_email
    @list = List.find(params[:id])
    @items = params[:items]
    ListMailer.skipped_items_email(@list.author, @list.author_email, @items).deliver_now
    render nothing: true
  end

  private
  def email_params
    params.require(:email).permit(:recipient_email, :recipient_name, :message, :list_id, :sender_email, :sender_name)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
