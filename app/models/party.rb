# Public: Defines political groupings of Members
class Party < ActiveRecord::Base
  has_many :memberships
  has_many :members, :through => :memberships
end
