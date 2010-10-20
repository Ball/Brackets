require 'spec_helper'

describe "pools/new.html.erb" do
  before(:each) do
    assign(:pool, stub_model(Pool).as_new_record)
  end

  it "renders new pool form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => pools_path, :method => "post" do
    end
  end
end
