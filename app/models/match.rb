class Match < ActiveRecord::Base
  attr_accessible :player, :level

  has_many :games
end
