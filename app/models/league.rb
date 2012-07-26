class League < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :teams
  attr_accessible :teams_attributes
  validates_presence_of :name
  validate :validate_teams_length

  has_many :teams
  has_many :rounds

  accepts_nested_attributes_for :teams
  
  def save_with_rounds
    self.rounds = self.make_rounds
    return self.save
  end
  
  def make_rounds()
    #If odd insert dummy club
    clubs = self.teams.to_a
    if clubs.length % 2 == 1
      clubs << Team.new(:name => "Descansa")
    end
    rounds_home = []
    rounds_away = []
    num_rounds = clubs.length - 2
    num_matches = clubs.length / 2 - 1
    rounds_add = num_rounds / 2

    for i in (0..num_rounds)
      matches_home = Round.new(:number => i)
      matches_away = Round.new(:number => i+rounds_add)
      for j in (0..num_matches)
        matches_home.matches << Match.new(:home => clubs[j], :away => clubs[num_rounds - j + 1]) #Home match
        matches_away.matches << Match.new(:home => clubs[num_rounds - j + 1], :away => clubs[j]) #Away match 
      end
      rounds_home << matches_home
      rounds_away << matches_away
      #rotating the teams
      last = clubs.pop 
      clubs.insert(1, last)
    end
    rounds_away.each { |x| rounds_home << x}
    return rounds_home
  end

def print_rounds()
  rounds = self.make_rounds
  i = 1
  value = ""
  rounds.each do |round|
    value = value + "Round: #{round.number}<br />"
    round.matches.each do |match|
      value = value + "Match: #{match.home.name} - #{match.away.name}<br />"
    end
    i += 1
  end
  return value.html_safe
end

private
  def validate_teams_length
    errors.add(:teams, "The minimum number of teams is two") if teams.length < 2
  end
end
