# Public: An elected representative to an Constituency
class Member < ActiveRecord::Base
  has_many :memberships
  has_many :parties, -> { order('log_date DESC') }, through: :memberships
  has_many :representations
  has_many :constituencies, -> { order('log_date DESC') }, :through => :representations
  has_many :roles
  has_many :positions, -> { where(role: { end_log_date: nil }).order('log_date DESC') }, :through => :roles
  has_many :speeches, -> { order('log_date DESC') }
  has_many :debates, through: :speeches
  has_many :api_keys

  validates :forename, presence: true
  validates :surname, presence: true

  after_save :create_slug

  attachment :photo

  # Public: Overrides Rails use of route paramters
  #
  # Returns a String of the slug
  def to_param
    "#{ slug }"
  end

  # Public: Returns the full name of a Member
  #
  # Returns a String of their full name
  def name
    "#{ forename } #{ surname }"
  end

  # Public: Find their party affiliation
  #
  # Returns their latest Party affiliation
  def party
    parties.first
  end

  # Public: Find the area they are elected to represent
  #
  # Returns their latest Constituency
  def constituency
    constituencies.first
  end

  # Public: find random current Members
  #
  # Integer - limit number of returned Members
  #
  # Returns an Array of Members
  def self.random(number)
    Representation.where(end_log_date: nil).limit(number).order("RAND()").collect(&:member)
  end

  # Public: Finds if Member is currently serving
  #
  # Looks for lastest representation and see if there is an end date
  #
  # Returns a Boolean
  def current?
    representations.any? && !representations.last.end_log_date
  end

  # Public: Finds the date, the Member first was elected
  #
  # Looks for the start date of the first representation
  #
  # Returns a Date
  def entered_senedd
    representations.first.log_date
  end

  # Public: Finds the date, the Member ended being a representative
  #
  # Looks for the end date of the last representation
  #
  # Returns a Date
  def left_senedd
    representations.last.end_log_date
  end

  private

  def create_slug
    if self.slug.nil?
      self.slug = "#{ id }-#{ name.parameterize }"
      save
    end
  end
end
