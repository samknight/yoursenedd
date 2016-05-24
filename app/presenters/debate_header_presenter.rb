class DebateHeaderPresenter < ApplicationPresenter
  presents :debate
  delegate :name, :log_date, :speeches, :first_speech_by, :speakers, to: :debate

  def properties
    hash = {
      name: name,
      date: date,
      number_of_speeches: number_of_speeches,
      speakers: speakers_attributes
    }
  end

  private

  def date
    log_date.to_s(:long)
  end

  def number_of_speeches
    speeches.size
  end

  def speakers_attributes
    speakers.collect do |speaker|
      {
        name: speaker.name,
        first_speech_id: first_speech_by(speaker).id,
        image: attachment_url(speaker, :photo, :fill, 50, 50, format: "jpg") || 'silhouette.jpg'
      }
    end
  end

end
