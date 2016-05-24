class WeeklyController < ApplicationController
  layout 'landing'

  def index
    if params[:confirmation]
      flash[:confirmation] = "We've sent you an email to confirm your subscription. Please check your spam folder."
    end
  end
end
