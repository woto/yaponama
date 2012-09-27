class SpareInfosController < ApplicationController
  # GET /spare_infos
  # GET /spare_infos.json
  def index
    @spare_infos = SpareInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @spare_infos }
    end
  end

  # GET /spare_infos/1
  # GET /spare_infos/1.json
  def show
    @spare_info = SpareInfo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @spare_info }
    end
  end

  # GET /spare_infos/new
  # GET /spare_infos/new.json
  def new
    @spare_info = SpareInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @spare_info }
    end
  end

  # GET /spare_infos/1/edit
  def edit
    @spare_info = SpareInfo.find(params[:id])
  end

  # POST /spare_infos
  # POST /spare_infos.json
  def create
    @spare_info = SpareInfo.new(params[:spare_info])

    respond_to do |format|
      if @spare_info.save
        format.html { redirect_to @spare_info, :notice => 'Spare info was successfully created.' }
        format.json { render :json => @spare_info, :status => :created, :location => @spare_info }
      else
        format.html { render :action => "new" }
        format.json { render :json => @spare_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /spare_infos/1
  # PUT /spare_infos/1.json
  def update
    @spare_info = SpareInfo.find(params[:id])

    respond_to do |format|
      if @spare_info.update_attributes(params[:spare_info])
        format.html { redirect_to @spare_info, :notice => 'Spare info was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @spare_info.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /spare_infos/1
  # DELETE /spare_infos/1.json
  def destroy
    @spare_info = SpareInfo.find(params[:id])
    @spare_info.destroy

    respond_to do |format|
      format.html { redirect_to spare_infos_url }
      format.json { head :ok }
    end
  end
end
