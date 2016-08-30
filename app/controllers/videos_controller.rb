class VideosController < ApplicationController

  def show
    day = Debate.find_by(tv: params[:id]).log_date
    @speech = find_speech(day, params[:timestamp])
  end

  private

  def video_params
    params.permit(:id, :timestamp, :autostart, :captions)
  end

  def find_speech(day, timestamp = nil)
    if timestamp
      Speech.find_by(log_date: day, spoke_at: DateTime.parse(timestamp).in_time_zone)
    else
      Speech.find_by(log_date: day)
    end
  end
end
