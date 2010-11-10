require 'spec_helper'
describe Bracket do
  context "New bracket creation" do
    before(:each) { @bracket = Bracket.build }
    it "should create with 67 picks" do
    	  @bracket.picks.size.should == 67
    end
    it "should have 4 round zero picks" do
	  @bracket.picks.select{|e| e.round == 0}.size.should == 4
    end
    it "should have 32 round 1 picks" do
          @bracket.picks.select{|e| e.round == 1}.size.should == 32
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
end
