class VideosController < ApplicationController

  def show
    day = Debate.find_by(tv: params[:id]).log_date
    @speech = Speech.find_by(log_date: day, spoke_at: DateTime.parse(params[:timestamp]).in_time_zone)
  end

  def video_params
    params.permit(:id, :timestamp, :autostart, :captions)
  end
end
