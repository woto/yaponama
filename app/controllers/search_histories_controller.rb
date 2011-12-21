class SearchHistoriesController < ApplicationController
  # GET /search_histories
  # GET /search_histories.json
  def index

    @search_histories = user_search_histories

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @search_histories }
    end
  end

  # GET /search_histories/1
  # GET /search_histories/1.json
  def show
    @search_history = SearchHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @search_history }
    end
  end

  # GET /search_histories/new
  # GET /search_histories/new.json
  def new
    @search_history = SearchHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @search_history }
    end
  end

  # GET /search_histories/1/edit
  def edit
    @search_history = SearchHistory.find(params[:id])
  end

  # POST /search_histories
  # POST /search_histories.json
  def create
    @search_history = SearchHistory.new(params[:search_history])

    respond_to do |format|
      if @search_history.save
        format.html { redirect_to @search_history, :notice => 'Search history was successfully created.' }
        format.json { render :json => @search_history, :status => :created, :location => @search_history }
      else
        format.html { render :action => "new" }
        format.json { render :json => @search_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /search_histories/1
  # PUT /search_histories/1.json
  def update
    @search_history = SearchHistory.find(params[:id])

    respond_to do |format|
      if @search_history.update_attributes(params[:search_history])
        format.html { redirect_to @search_history, :notice => 'Search history was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @search_history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /search_histories/1
  # DELETE /search_histories/1.json
  def destroy
    @search_history = SearchHistory.find(params[:id])
    @search_history.destroy

    respond_to do |format|
      format.html { redirect_to search_histories_url }
      format.json { head :ok }
    end
  end
end
