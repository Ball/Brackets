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
      pending "Too hardz!  Regions need ordered and code needs written"
      picks = @bracket.round_one
      picks[0].team1.should == "Team 1"
      picks[0].team2.should be_nil
      picks[1].team1.should == "Team 8"
      picks[1].team2.should == "Team 9"
      picks[2].team1.should == "Team 5"
      picks[2].team2.should == "Team 12"
      picks[3].team1.should == "Team 4"
      picks[3].team2.should == "Team 13"
      picks[4].team1.should == "Team 3"
      picks[4].team2.should == "Team 14"
      picks[5].team1.should == "Team 6"
      picks[5].team2.should == "Team 11"
      picks[6].team1.should == "Team 7"
      picks[6].team2.should == "Team 10"
      picks[7].team1.should == "Team 2"
      picks[7].team2.should == "Team 15"
      picks[8].team1.should == "Team 18"
      picks[8].team2.should be_nil
      picks[9].team1.should == "Team 25"
      picks[9].team2.should == "Team 26"
      picks[10].team1.should == "Team 22"
      picks[10].team2.should == "Team 29"
      picks[11].team1.should == "Team 21"
      picks[11].team2.should == "Team 30"
      picks[12].team1.should == "Team 20"
      picks[12].team2.should == "Team 31"
      picks[13].team1.should == "Team 23"
      picks[13].team2.should == "Team 28"
      picks[14].team1.should == "Team 24"
      picks[14].team2.should == "Team 27"
      picks[15].team1.should == "Team 19"
      picks[15].team2.should == "Team 32"
      picks[16].team1.should == "Team 35"
      picks[16].team2.should be_nil
      picks[17].team1.should == "Team 42"
      picks[17].team2.should == "Team 43"
      picks[18].team1.should == "Team 39"
      picks[18].team2.should == "Team 46"
      picks[19].team1.should == "Team 38"
      picks[19].team2.should == "Team 47"
      picks[20].team1.should == "Team 37"
      picks[20].team2.should == "Team 48"
      picks[21].team1.should == "Team 40"
      picks[21].team2.should == "Team 45"
      picks[22].team1.should == "Team 41"
      picks[22].team2.should == "Team 44"
      picks[23].team1.should == "Team 36"
      picks[23].team2.should == "Team 49"
      picks[24].team1.should == "Team 52"
      picks[24].team2.should be_nil
      picks[25].team1.should == "Team 59"
      picks[25].team2.should == "Team 60"
      picks[26].team1.should == "Team 56"
      picks[26].team2.should == "Team 63"
      picks[27].team1.should == "Team 55"
      picks[27].team2.should == "Team 64"
      picks[28].team1.should == "Team 54" 
      picks[28].team2.should == "Team 65"
      picks[29].team1.should == "Team 57"
      picks[29].team2.should == "Team 62"
      picks[30].team1.should == "Team 58"
      picks[30].team2.should == "Team 61"
      picks[31].team1.should == "Team 53"
      picks[31].team2.should == "Team 66"
    end
  end
end
