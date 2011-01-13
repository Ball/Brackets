class BracketsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /brackets
  # GET /brackets.xml
  def index
    pool = Pool.find(params[:pool_id])
    @brackets = pool.brackets

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @brackets }
    end
  end

  # GET /brackets/1
  # GET /brackets/1.xml
  def show
    @bracket = @pool.brackets.Pool.find(params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bracket }
    end
  end

  # GET /brackets/new
  # GET /brackets/new.xml
  def new
    @pool = Pool.find(params[:pool_id])

    @bracket = Bracket.build(@pool)

    @bracket.populate_teams(Tournament.find(@pool.tournament_id))

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bracket }
    end
  end

  # GET /brackets/1/edit
  def edit
    @bracket = Pool.find(params[:id])
    @tournaments = Tournament.all.collect{|t| [t.name, t._id] }
  end

  # POST /brackets
  # POST /brackets.xml
  def create
    @pool = Pool.find(params[:pool_id])
    @bracket = Bracket.new(params[:bracket])
    @bracket.owner = current_user._id
    @pool.brackets ||= []
    @pool.brackets << @bracket

    respond_to do |format|
      if @pool.save
        format.html { redirect_to(@pool, :notice => "Bracket #{@bracket.name} was successfully created and added to pool #{@pool.name}.") }
        format.xml  { render :xml => @bracket, :status => :created, :location => @bracket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bracket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brackets/1
  # PUT /brackets/1.xml
  def update
    @bracket = Pool.find(params[:id])

    respond_to do |format|
      if @bracket.update_attributes(params[:bracket])
        format.html { redirect_to(@bracket, :notice => 'Pool was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bracket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /brackets/1
  # DELETE /brackets/1.xml
  def destroy
    @bracket = Pool.find(params[:id])
    @bracket.destroy

    respond_to do |format|
      format.html { redirect_to(brackets_url) }
      format.xml  { head :ok }
    end
  end
end
