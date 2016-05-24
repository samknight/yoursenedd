# Defines the period a Member held a governmental Position
class Role < ActiveRecord::Base
  belongs_to :member
  belongs_to :position
end
