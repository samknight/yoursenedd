class DebatesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @debates_days = Debate.all.group_by { |a| a.log_date.to_date }
  end

  def show
    @debate = Debate.where(slug: params[:id]).first!
  end
end
