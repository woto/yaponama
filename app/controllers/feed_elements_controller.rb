class FeedElementsController < ApplicationController
  # GET /feed_elements
  # GET /feed_elements.json
  def index
    @feed_elements = FeedElement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @feed_elements }
    end
  end

  # GET /feed_elements/1
  # GET /feed_elements/1.json
  def show
    @feed_element = FeedElement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @feed_element }
    end
  end

  # GET /feed_elements/new
  # GET /feed_elements/new.json
  def new
    @feed_element = FeedElement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @feed_element }
    end
  end

  # GET /feed_elements/1/edit
  def edit
    @feed_element = FeedElement.find(params[:id])
  end

  # POST /feed_elements
  # POST /feed_elements.json
  def create
    @feed_element = FeedElement.new(params[:feed_element])

    respond_to do |format|
      if @feed_element.save
        format.html { redirect_to @feed_element, :notice => 'Feed element was successfully created.' }
        format.json { render :json => @feed_element, :status => :created, :location => @feed_element }
      else
        format.html { render :action => "new" }
        format.json { render :json => @feed_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /feed_elements/1
  # PUT /feed_elements/1.json
  def update
    @feed_element = FeedElement.find(params[:id])

    respond_to do |format|
      if @feed_element.update_attributes(params[:feed_element])
        format.html { redirect_to @feed_element, :notice => 'Feed element was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @feed_element.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_elements/1
  # DELETE /feed_elements/1.json
  def destroy
    @feed_element = FeedElement.find(params[:id])
    @feed_element.destroy

    respond_to do |format|
      format.html { redirect_to feed_elements_url }
      format.json { head :ok }
    end
  end
end
