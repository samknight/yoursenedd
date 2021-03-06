class AdvertisingController < ApplicationController
  before_filter :authenticate_user!, :except => [:new, :create]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      InterestNotifier.send_advert_request(@message).deliver_now
      redirect_to advertising_path, notice: "Thank you for your interest in advertising with us."
    else
      flash[:alert] = "Please fill in all fields"
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
