# Public: An area that returns a Member to the Assembly
class Constituency < ActiveRecord::Base
  has_many :representations
  has_many :members, -> { order('log_date DESC') }, :through => :representations
end
