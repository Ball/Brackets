require 'spec_helper'

describe "picks/new.html.erb" do
  before(:each) do
    assign(:pick, stub_model(Pick,
      :team1 => "MyString",
      :team2 => "MyString",
      :winner => "MyString",
      :round => 1,
      :game_number => 1
    ).as_new_record)
  end

  it "renders new pick form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => picks_path, :method => "post" do
      assert_select "input#pick_team1", :name => "pick[team1]"
      assert_select "input#pick_team2", :name => "pick[team2]"
      assert_select "input#pick_winner", :name => "pick[winner]"
      assert_select "input#pick_round", :name => "pick[round]"
      assert_select "input#pick_game_number", :name => "pick[game_number]"
    end
  end
end
