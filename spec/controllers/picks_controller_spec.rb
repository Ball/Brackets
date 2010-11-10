require 'spec_helper'

describe PicksController do

  def mock_pick(stubs={})
    @mock_pick ||= mock_model(Pick, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all picks as @picks" do
      Pick.stub(:all) { [mock_pick] }
      get :index
      assigns(:picks).should eq([mock_pick])
    end
  end

  describe "GET show" do
    it "assigns the requested pick as @pick" do
      Pick.stub(:find).with("37") { mock_pick }
      get :show, :id => "37"
      assigns(:pick).should be(mock_pick)
    end
  end

  describe "GET new" do
    it "assigns a new pick as @pick" do
      Pick.stub(:new) { mock_pick }
      get :new
      assigns(:pick).should be(mock_pick)
    end
  end

  describe "GET edit" do
    it "assigns the requested pick as @pick" do
      Pick.stub(:find).with("37") { mock_pick }
      get :edit, :id => "37"
      assigns(:pick).should be(mock_pick)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created pick as @pick" do
        Pick.stub(:new).with({'these' => 'params'}) { mock_pick(:save => true) }
        post :create, :pick => {'these' => 'params'}
        assigns(:pick).should be(mock_pick)
      end

      it "redirects to the created pick" do
        Pick.stub(:new) { mock_pick(:save => true) }
        post :create, :pick => {}
        response.should redirect_to(pick_url(mock_pick))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pick as @pick" do
        Pick.stub(:new).with({'these' => 'params'}) { mock_pick(:save => false) }
        post :create, :pick => {'these' => 'params'}
        assigns(:pick).should be(mock_pick)
      end

      it "re-renders the 'new' template" do
        Pick.stub(:new) { mock_pick(:save => false) }
        post :create, :pick => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested pick" do
        Pick.should_receive(:find).with("37") { mock_pick }
        mock_pick.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pick => {'these' => 'params'}
      end

      it "assigns the requested pick as @pick" do
        Pick.stub(:find) { mock_pick(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:pick).should be(mock_pick)
      end

      it "redirects to the pick" do
        Pick.stub(:find) { mock_pick(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pick_url(mock_pick))
      end
    end

    describe "with invalid params" do
      it "assigns the pick as @pick" do
        Pick.stub(:find) { mock_pick(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:pick).should be(mock_pick)
      end

      it "re-renders the 'edit' template" do
        Pick.stub(:find) { mock_pick(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested pick" do
      Pick.should_receive(:find).with("37") { mock_pick }
      mock_pick.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the picks list" do
      Pick.stub(:find) { mock_pick }
      delete :destroy, :id => "1"
      response.should redirect_to(picks_url)
    end
  end

end
