require 'spec_helper'

describe "picks/edit.html.erb" do
  before(:each) do
    @pick = assign(:pick, stub_model(Pick,
      :new_record? => false,
      :team1 => "MyString",
      :team2 => "MyString",
      :winner => "MyString",
      :round => 1,
      :game_number => 1
    ))
  end

  it "renders the edit pick form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => pick_path(@pick), :method => "post" do
      assert_select "input#pick_team1", :name => "pick[team1]"
      assert_select "input#pick_team2", :name => "pick[team2]"
      assert_select "input#pick_winner", :name => "pick[winner]"
      assert_select "input#pick_round", :name => "pick[round]"
      assert_select "input#pick_game_number", :name => "pick[game_number]"
    end
  end
end
