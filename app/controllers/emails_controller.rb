class EmailsController < ApplicationController

  def index
  end


  def new
    @list = List.find(params[:list_id])
    @email = Email.new
  end

  def create
    @list = List.find(params[:list_id])
    @email = Email.create(email_params)
    @email.list_id = params[:list_id]
    if @email.save
      ListMailer.email_list(@email.recipient_name, @email.recipient_email, @email.list_id).deliver_now
    end
    redirect_to lists_path
  end

  private
  def email_params
    params.require(:email).permit(:recipient_email, :recipient_name, :message, :list_id)
  end

end
