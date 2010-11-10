require "spec_helper"

describe PicksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/picks" }.should route_to(:controller => "picks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/picks/new" }.should route_to(:controller => "picks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/picks/1" }.should route_to(:controller => "picks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/picks/1/edit" }.should route_to(:controller => "picks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/picks" }.should route_to(:controller => "picks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/picks/1" }.should route_to(:controller => "picks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/picks/1" }.should route_to(:controller => "picks", :action => "destroy", :id => "1")
    end

  end
end
