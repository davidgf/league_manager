require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save without name or without teams" do
    t = Team.new
    assert !t.save
    t.name = 'nome'
    assert t.save
  end
end
