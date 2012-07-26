class Round < ActiveRecord::Base
  attr_accessible :number
  has_many :matches
end
