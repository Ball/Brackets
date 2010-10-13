require 'spec_helper'

describe Tournament do
  context "After 2 phase initialization" do
    before (:each) do
      @tournament = Tournament.new
      @tournament.populate_seeds
    end

    it "should have 68 seeds" do
      @tournament.seedings.size.should == 68
    end
    it "should have 17 midwest seeds" do
	    @tournament.seedings.select{ |s| s.region == "Midwest" }.size.should == 17
    end
    it "should seed the regions" do
	    @tournament.seedings.first.seed.should == 1
    end
  end
end
