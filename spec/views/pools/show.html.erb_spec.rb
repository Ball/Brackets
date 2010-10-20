require 'spec_helper'

describe "pools/show.html.erb" do
  before(:each) do
    @pool = assign(:pool, stub_model(Pool))
  end

  it "renders attributes in <p>" do
    render
  end
end
