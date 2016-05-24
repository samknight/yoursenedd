# Defines the a Member's contribution to a Debate
class Speech < ActiveRecord::Base
  belongs_to :debate
  belongs_to :member
end
