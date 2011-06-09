class PlacesController < ApplicationController
  # GET /places
  # GET /places.xml
  def index
    @client = GooglePlaces::Client.new('AIzaSyBvYVOcbw2eZ482m0sk5o7N-5NScHjnOMU')
    @places = GooglePlaces::Spot.list(39.58, -85.86, 'AIzaSyBvYVOcbw2eZ482m0sk5o7N-5NScHjnOMU', :types => ['restaurant', 'food'])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end

  def random
    @place = Place.first(:order => 'RANDOM()')
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end
  
  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.xml
  def create
    @myLoc = Geocoder.coordinates(params[:location])
    
    @places = GooglePlaces::Spot.list(@myLoc[0], @myLoc[1], 'AIzaSyBvYVOcbw2eZ482m0sk5o7N-5NScHjnOMU', :types => ['restaurant', 'food'])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place, :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end
end
