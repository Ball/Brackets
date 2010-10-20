require "spec_helper"

describe PoolsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/pools" }.should route_to(:controller => "pools", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/pools/new" }.should route_to(:controller => "pools", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pools/1" }.should route_to(:controller => "pools", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pools/1/edit" }.should route_to(:controller => "pools", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pools" }.should route_to(:controller => "pools", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pools/1" }.should route_to(:controller => "pools", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pools/1" }.should route_to(:controller => "pools", :action => "destroy", :id => "1")
    end

  end
end
