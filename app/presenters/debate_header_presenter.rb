class DebateHeaderPresenter < ApplicationPresenter
  presents :debate
  delegate :name, :name_cy, :log_date, :speeches, :first_speech_by, :speakers, to: :debate

  def properties
    hash = {
      name: locale_name,
      date: date,
      number_of_speeches: number_of_speeches,
      speakers: speakers_attributes
    }
  end

  private

  def date
    I18n.l log_date, format: :long
  end

  def locale_name
    if I18n.locale == :cy && !name_cy.nil?
      name_cy
    else
      name
    end
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
