class ToyotaEpc::PartNumberListChildrenController < ApplicationController
  # GET /toyota_epc/part_number_list_children
  # GET /toyota_epc/part_number_list_children.json
  def index
    @toyota_epc_part_number_list_children = ToyotaEpc::PartNumberListChild.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @toyota_epc_part_number_list_children }
    end
  end

  # GET /toyota_epc/part_number_list_children/1
  # GET /toyota_epc/part_number_list_children/1.json
  def show
    @toyota_epc_part_number_list_child = ToyotaEpc::PartNumberListChild.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @toyota_epc_part_number_list_child }
    end
  end

  # GET /toyota_epc/part_number_list_children/new
  # GET /toyota_epc/part_number_list_children/new.json
  def new
    @toyota_epc_part_number_list_child = ToyotaEpc::PartNumberListChild.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @toyota_epc_part_number_list_child }
    end
  end

  # GET /toyota_epc/part_number_list_children/1/edit
  def edit
    @toyota_epc_part_number_list_child = ToyotaEpc::PartNumberListChild.find(params[:id])
  end

  # POST /toyota_epc/part_number_list_children
  # POST /toyota_epc/part_number_list_children.json
  def create
    @toyota_epc_part_number_list_child = ToyotaEpc::PartNumberListChild.new(params[:toyota_epc_part_number_list_child])

    respond_to do |format|
      if @toyota_epc_part_number_list_child.save
        format.html { redirect_to @toyota_epc_part_number_list_child, :notice => 'Part number list child was successfully created.' }
        format.json { render :json => @toyota_epc_part_number_list_child, :status => :created, :location => @toyota_epc_part_number_list_child }
      else
        format.html { render :action => "new" }
        format.json { render :json => @toyota_epc_part_number_list_child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /toyota_epc/part_number_list_children/1
  # PUT /toyota_epc/part_number_list_children/1.json
  def update
    @toyota_epc_part_number_list_child = ToyotaEpc::PartNumberListChild.find(params[:id])

    respond_to do |format|
      if @toyota_epc_part_number_list_child.update_attributes(params[:toyota_epc_part_number_list_child])
        format.html { redirect_to @toyota_epc_part_number_list_child, :notice => 'Part number list child was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @toyota_epc_part_number_list_child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /toyota_epc/part_number_list_children/1
  # DELETE /toyota_epc/part_number_list_children/1.json
  def destroy
    @toyota_epc_part_number_list_child = ToyotaEpc::PartNumberListChild.find(params[:id])
    @toyota_epc_part_number_list_child.destroy

    respond_to do |format|
      format.html { redirect_to toyota_epc_part_number_list_children_url }
      format.json { head :ok }
    end
  end
end
