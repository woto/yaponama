class ToyotaEpc::PartNumberListParentsController < ApplicationController
  # GET /toyota_epc/part_number_list_parents
  # GET /toyota_epc/part_number_list_parents.json
  def index
    @toyota_epc_part_number_list_parents = ToyotaEpc::PartNumberListParent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @toyota_epc_part_number_list_parents }
    end
  end

  # GET /toyota_epc/part_number_list_parents/1
  # GET /toyota_epc/part_number_list_parents/1.json
  def show
    @toyota_epc_part_number_list_parent = ToyotaEpc::PartNumberListParent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @toyota_epc_part_number_list_parent }
    end
  end

  # GET /toyota_epc/part_number_list_parents/new
  # GET /toyota_epc/part_number_list_parents/new.json
  def new
    @toyota_epc_part_number_list_parent = ToyotaEpc::PartNumberListParent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @toyota_epc_part_number_list_parent }
    end
  end

  # GET /toyota_epc/part_number_list_parents/1/edit
  def edit
    @toyota_epc_part_number_list_parent = ToyotaEpc::PartNumberListParent.find(params[:id])
  end

  # POST /toyota_epc/part_number_list_parents
  # POST /toyota_epc/part_number_list_parents.json
  def create
    @toyota_epc_part_number_list_parent = ToyotaEpc::PartNumberListParent.new(params[:toyota_epc_part_number_list_parent])

    respond_to do |format|
      if @toyota_epc_part_number_list_parent.save
        format.html { redirect_to @toyota_epc_part_number_list_parent, :notice => 'Part number list parent was successfully created.' }
        format.json { render :json => @toyota_epc_part_number_list_parent, :status => :created, :location => @toyota_epc_part_number_list_parent }
      else
        format.html { render :action => "new" }
        format.json { render :json => @toyota_epc_part_number_list_parent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /toyota_epc/part_number_list_parents/1
  # PUT /toyota_epc/part_number_list_parents/1.json
  def update
    @toyota_epc_part_number_list_parent = ToyotaEpc::PartNumberListParent.find(params[:id])

    respond_to do |format|
      if @toyota_epc_part_number_list_parent.update_attributes(params[:toyota_epc_part_number_list_parent])
        format.html { redirect_to @toyota_epc_part_number_list_parent, :notice => 'Part number list parent was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @toyota_epc_part_number_list_parent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /toyota_epc/part_number_list_parents/1
  # DELETE /toyota_epc/part_number_list_parents/1.json
  def destroy
    @toyota_epc_part_number_list_parent = ToyotaEpc::PartNumberListParent.find(params[:id])
    @toyota_epc_part_number_list_parent.destroy

    respond_to do |format|
      format.html { redirect_to toyota_epc_part_number_list_parents_url }
      format.json { head :ok }
    end
  end
end
