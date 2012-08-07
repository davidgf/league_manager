require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should save with name and two teams" do
    l = League.new
    assert !l.save_with_rounds, 'Name missing'
    l.name = 'nome'
    assert !l.save_with_rounds, 'Teams missing'
    l.teams << teams(:one)
    assert !l.save_with_rounds, 'Just one team'
    l.teams << teams(:two)
    assert !l.save_with_rounds, 'Two teams'
    assert l.rounds.length > 0, 'No rounds'
  end
end
