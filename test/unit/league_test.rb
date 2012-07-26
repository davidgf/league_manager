require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should save with name and two teams" do
    l = League.new
    assert !l.save, 'Name missing'
    l.name = 'nome'
    assert !l.save, 'Teams missing'
    l.teams << teams(:one)
    assert !l.save, 'Just one team'
    l.teams << teams(:two)
    assert l.save, 'Two teams'
  end
end
