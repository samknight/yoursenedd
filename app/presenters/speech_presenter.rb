class SpeechPresenter < ApplicationPresenter
  presents :speech
  delegate :id, :content, :debate, :member, to: :speech

  def properties
    {
      id: id,
      avatar: attachment_url(member, :photo, :fill, 200, 200, format: "jpg") || 'silhouette.jpg',
      name: member.name,
      body: content,
      slug: slug,
      member_link: member_path(member.to_param),
      speech_link: speech_link
    }
  end

  private

  def slug
    "#{ debate.slug }##{ id }"
  end

  def speech_link
    debate_path(debate) + "##{ id }"
  end
end
