require 'spec_helper'

describe "picks/index.html.erb" do
  before(:each) do
    assign(:picks, [
      stub_model(Pick,
        :team1 => "Team1",
        :team2 => "Team2",
        :winner => "Winner",
        :round => 1,
        :game_number => 1
      ),
      stub_model(Pick,
        :team1 => "Team1",
        :team2 => "Team2",
        :winner => "Winner",
        :round => 1,
        :game_number => 1
      )
    ])
  end

  it "renders a list of picks" do
    pending "Look at views later"
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Team1".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Team2".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Winner".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
