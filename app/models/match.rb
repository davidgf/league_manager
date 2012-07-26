class Match < ActiveRecord::Base
  attr_accessible :home, :away
  belongs_to :home, :class_name => "Team"
  belongs_to :away, :class_name => "Team"
  belongs_to :round
end
