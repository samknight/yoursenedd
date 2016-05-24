class DashboardController < ApplicationController

  before_filter :authenticate_user!, except: :index

  def index
    @debates = Debate.all
    @debates_days = @debates.group_by { |a| a.log_date.to_date }
    @members = Member.random(10)
  end
end
