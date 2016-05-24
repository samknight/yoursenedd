# Defines the period a Member was affiliated to a Party
class Membership < ActiveRecord::Base
  belongs_to :member
  belongs_to :party
end
