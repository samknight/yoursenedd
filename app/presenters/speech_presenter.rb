class SpeechPresenter < ApplicationPresenter
  presents :speech
  delegate :id, :content, :content_cy, :debate, :member, to: :speech

  def properties
    {
      id: id,
      avatar: attachment_url(member, :photo, :fit, 200, 200, format: "jpg") || 'silhouette.jpg',
      name: member.name,
      body: locale_content,
      member_link: member_path(member.to_param),
      speech_link: speech_link,
      video_path: video_link_path,
      video_link: video_link
    }
  end

  private

  def speech_link
    debate_url(debate) + "##{ id }"
  end

  def video_link_path
    if I18n.locale == :cy && !debate.tv_cy.blank?
      video_path(debate.tv_cy, timestamp: speech.spoke_at.utc.to_s.split("UTC").first)
    elsif !debate.tv.blank?
      video_path(debate.tv, timestamp: speech.spoke_at.utc.to_s.split("UTC").first)
    end
  end

  def video_link
    if I18n.locale == :cy && !debate.tv_cy.blank?
      video_url(debate.tv_cy, timestamp: speech.spoke_at.utc.to_s.split("UTC").first)
    elsif !debate.tv.blank?
      video_url(debate.tv, timestamp: speech.spoke_at.utc.to_s.split("UTC").first)
    end
  end

  def locale_content
    if I18n.locale == :cy && !content_cy.nil?
      content_cy
    else
      content
    end
  end
end
