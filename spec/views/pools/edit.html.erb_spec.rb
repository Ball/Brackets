require 'spec_helper'

describe "pools/edit.html.erb" do
  before(:each) do
    @pool = assign(:pool, stub_model(Pool,
      :new_record? => false
    ))
    @tournaments = []
  end

  it "renders the edit pool form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => pool_path(@pool), :method => "post" do
    end
  end
end
