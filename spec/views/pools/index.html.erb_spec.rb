require 'spec_helper'

describe "pools/index.html.erb" do
  before(:each) do
    assign(:pools, [
      stub_model(Pool),
      stub_model(Pool)
    ])
  end

  it "renders a list of pools" do
    render
  end
end
