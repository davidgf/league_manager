class Team < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  
  belongs_to :league
  has_many :matches
end
