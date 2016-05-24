# Public: A group of Speeches related to a topic in a plenary session
class Debate < ActiveRecord::Base
  has_many :speeches
  has_many :members, through: :speeches

  default_scope { order("log_date DESC") }

  before_save :create_slug

  # Public: Use slug instead of ID for routes
  #
  # Returns a String of the designated URL
  def to_param
    "#{slug}"
  end

  # Public: Get the ID for the first Speech a Member made
  #
  # Member - the Member who's first speech is to be retrieved
  #
  # Returns the speech ID as an Integer
  def first_speech_by(member)
    Speech.where(debate_id: self.id, member_id: member.id).first or
      NilSpeech.new
  end

  # Public: Finds everyone who spoke in a Debate
  #
  # Returns an Array of Members
  def speakers
    speeches.map(&:member).uniq
  end

  private

  # Private: defines the pattern for a debate URL
  def create_slug
    self.slug = "#{ log_date }-#{ name.parameterize }"
  end
end
