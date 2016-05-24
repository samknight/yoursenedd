class RepresentationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @representations = Representation.where(end_log_date: nil)
  end

  def new
    @representation = Representation.new
  end

  def create
    @representation = Representation.new(representation_params)
    @representation.save

    redirect_to representations_path
  end

  def edit
    @representation = Representation.find(params[:id])
  end

  def update
    @representation = Representation.find(params[:id])
    @representation.update_attributes(representation_params)

    redirect_to representations_path
  end

  protected

  def representation_params
    params.require(:representation).permit(:member_id, :constituency_id, :log_date, :end_log_date)
  end
end
