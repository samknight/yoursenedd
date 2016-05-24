class MembersController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

  def index
    @members = Constituency.where(end_date: nil).order('name').map { |c| c.members.first }
  end

  def show
    @member = Member.where(slug: params[:id]).first!
  end

  def edit
    @member = Member.where(slug: params[:id]).first!
  end

  def update
    @member = Member.where(slug: params[:id]).first!
    @member.update_attributes(member_params)

    redirect_to member_path(@member)
  end

  protected

  def member_params
    params.require(:member).permit(:forename, :surname, :external_id, :photo)
  end
end
