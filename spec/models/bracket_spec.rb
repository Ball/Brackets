require 'spec_helper'
describe Bracket do
  context "New bracket creation" do
    before(:each) { @bracket = Bracket.build }
    it "should create with 67 picks" do
    	  @bracket.picks.size.should == 67
    end
    it "should have 4 round zero picks" do
      @bracket.round_zero.size.should == 4
    end
    it "should have 32 round 1 picks" do
          @bracket.round_one.size.should == 32
    end
    it "should have 16 round 2 picks" do
	    @bracket.picks.select{|e| e.round == 2}.size.should == 16
    end
    it "should have 8 round 3 picks" do
	    @bracket.picks.select{|e| e.round == 3}.size.should == 8
    end
    it "should have 4 round 4 picks" do
	    @bracket.picks.select{|e| e.round == 4}.size.should == 4
    end
    it "should have 2 round 5 picks" do
	    @bracket.picks.select{|e| e.round == 5}.size.should == 2
    end
    it "should have 1 round 6 picks" do
	    @bracket.picks.select{|e| e.round == 6}.size.should == 1
    end
  end

  context "Starting selection" do
    before(:each) do
      tournament = Tournament.new
      tournament.populate_seeds
      tournament.seedings.each_with_index{|seeding, i| seeding.team = "Team #{i+1}"}

      @bracket = Bracket.build
      @bracket.populate_teams(tournament)
    end

    it "should populate round zero picks with tournament teams" do
      picks = @bracket.round_zero

      picks.any?{|p| p.team1 == "Team 16" && p.team2 == "Team 17"}.should == true
      picks.any?{|p| p.team1 == "Team 33" && p.team2 == "Team 34"}.should == true
      picks.any?{|p| p.team1 == "Team 50" && p.team2 == "Team 51"}.should == true
      picks.any?{|p| p.team1 == "Team 67" && p.team2 == "Team 68"}.should == true
      picks.all?{|p| !p.team1.nil? && !p.team2.nil?}.should == true
    end
    it "should populate round one picks with tournament teams" do
      picks = @bracket.round_one
      picks[0].team1.should == "Team 1"
      picks[0].team2.should be_nil
      pending
    end
  end
end
