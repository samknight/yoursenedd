# Defines the period a Member was elected to a Constituency
class Representation < ActiveRecord::Base
  belongs_to :member
  belongs_to :constituency
end
