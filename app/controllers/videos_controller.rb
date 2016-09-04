class VideosController < ApplicationController

  def show
    day = find_day(params[:id])
    @speech = find_speech(day, params[:timestamp])
  end

  private

  def video_params
    params.permit(:id, :timestamp, :autostart, :captions)
  end

  def find_day(code)
    if I18n.locale == :en
      Debate.find_by(tv: code).log_date
    else
      Debate.find_by(tv_cy: code).log_date
    end
  end

  def find_speech(day, timestamp = nil)
    if timestamp
      Speech.find_by(log_date: day, spoke_at: DateTime.parse(timestamp).in_time_zone)
    else
      Speech.find_by(log_date: day)
    end
  end
end
