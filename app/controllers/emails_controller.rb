class EmailsController < ApplicationController
  # before_action :set_list

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
    @list.author = @email.recipient_name
    @list.author_email = @email.recipient_email
    redirect_to lists_path
  end

  def skipped_items_email
    @items = params[:items]
    ListMailer.skipped_items_email("Cam Stewbs", "cameron.webster@gmail.com", @items).deliver_now
    render json: "complete"
  end

  private
  def email_params
    params.require(:email).permit(:recipient_email, :recipient_name, :message, :list_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

end
