require 'spec_helper'

describe PoolsController do

  def mock_pool(stubs={})
    @mock_pool ||= mock_model(Pool, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all pools as @pools" do
      Pool.stub(:all) { [mock_pool] }
      get :index
      assigns(:pools).should eq([mock_pool])
    end
  end

  describe "GET show" do
    it "assigns the requested pool as @pool" do
      Pool.stub(:find).with("37") { mock_pool }
      get :show, :id => "37"
      assigns(:pool).should be(mock_pool)
    end
  end

  describe "GET new" do
    it "assigns a new pool as @pool" do
      Pool.stub(:new) { mock_pool }
      get :new
      assigns(:pool).should be(mock_pool)
      assigns(:tournaments).should_not be_nil
    end
  end

  describe "GET edit" do
    it "assigns the requested pool as @pool" do
      Pool.stub(:find).with("37") { mock_pool }
      get :edit, :id => "37"
      assigns(:pool).should be(mock_pool)
      assigns(:tournaments).should_not be_nil
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created pool as @pool" do
        Pool.stub(:new).with({'these' => 'params'}) { mock_pool(:save => true) }
        post :create, :pool => {'these' => 'params'}
        assigns(:pool).should be(mock_pool)
      end

      it "redirects to the created pool" do
        Pool.stub(:new) { mock_pool(:save => true) }
        post :create, :pool => {}
        response.should redirect_to(pool_url(mock_pool))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved pool as @pool" do
        Pool.stub(:new).with({'these' => 'params'}) { mock_pool(:save => false) }
        post :create, :pool => {'these' => 'params'}
        assigns(:pool).should be(mock_pool)
      end

      it "re-renders the 'new' template" do
        Pool.stub(:new) { mock_pool(:save => false) }
        post :create, :pool => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested pool" do
        Pool.should_receive(:find).with("37") { mock_pool }
        mock_pool.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :pool => {'these' => 'params'}
      end

      it "assigns the requested pool as @pool" do
        Pool.stub(:find) { mock_pool(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:pool).should be(mock_pool)
      end

      it "redirects to the pool" do
        Pool.stub(:find) { mock_pool(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(pool_url(mock_pool))
      end
    end

    describe "with invalid params" do
      it "assigns the pool as @pool" do
        Pool.stub(:find) { mock_pool(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:pool).should be(mock_pool)
      end

      it "re-renders the 'edit' template" do
        Pool.stub(:find) { mock_pool(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested pool" do
      Pool.should_receive(:find).with("37") { mock_pool }
      mock_pool.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the pools list" do
      Pool.stub(:find) { mock_pool }
      delete :destroy, :id => "1"
      response.should redirect_to(pools_url)
    end
  end

end
