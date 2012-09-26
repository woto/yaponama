class FeedCategoriesController < ApplicationController
  # GET /feed_categories
  # GET /feed_categories.json
  def index
    @feed_categories = FeedCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @feed_categories }
    end
  end

  # GET /feed_categories/1
  # GET /feed_categories/1.json
  def show
    @feed_category = FeedCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @feed_category }
    end
  end

  # GET /feed_categories/new
  # GET /feed_categories/new.json
  def new
    @feed_category = FeedCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @feed_category }
    end
  end

  # GET /feed_categories/1/edit
  def edit
    @feed_category = FeedCategory.find(params[:id])
  end

  # POST /feed_categories
  # POST /feed_categories.json
  def create
    @feed_category = FeedCategory.new(params[:feed_category])

    respond_to do |format|
      if @feed_category.save
        format.html { redirect_to @feed_category, :notice => 'Feed category was successfully created.' }
        format.json { render :json => @feed_category, :status => :created, :location => @feed_category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @feed_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /feed_categories/1
  # PUT /feed_categories/1.json
  def update
    @feed_category = FeedCategory.find(params[:id])

    respond_to do |format|
      if @feed_category.update_attributes(params[:feed_category])
        format.html { redirect_to @feed_category, :notice => 'Feed category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @feed_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_categories/1
  # DELETE /feed_categories/1.json
  def destroy
    @feed_category = FeedCategory.find(params[:id])
    @feed_category.destroy

    respond_to do |format|
      format.html { redirect_to feed_categories_url }
      format.json { head :ok }
    end
  end
end
