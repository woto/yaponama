class ToyotaEpc::PartNumberApplicationToModelsChildrenController < ApplicationController
  # GET /toyota_epc/part_number_application_to_models_children
  # GET /toyota_epc/part_number_application_to_models_children.json
  def index
    @toyota_epc_part_number_application_to_models_children = ToyotaEpc::PartNumberApplicationToModelsChild.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @toyota_epc_part_number_application_to_models_children }
    end
  end

  # GET /toyota_epc/part_number_application_to_models_children/1
  # GET /toyota_epc/part_number_application_to_models_children/1.json
  def show
    @toyota_epc_part_number_application_to_models_child = ToyotaEpc::PartNumberApplicationToModelsChild.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @toyota_epc_part_number_application_to_models_child }
    end
  end

  # GET /toyota_epc/part_number_application_to_models_children/new
  # GET /toyota_epc/part_number_application_to_models_children/new.json
  def new
    @toyota_epc_part_number_application_to_models_child = ToyotaEpc::PartNumberApplicationToModelsChild.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @toyota_epc_part_number_application_to_models_child }
    end
  end

  # GET /toyota_epc/part_number_application_to_models_children/1/edit
  def edit
    @toyota_epc_part_number_application_to_models_child = ToyotaEpc::PartNumberApplicationToModelsChild.find(params[:id])
  end

  # POST /toyota_epc/part_number_application_to_models_children
  # POST /toyota_epc/part_number_application_to_models_children.json
  def create
    @toyota_epc_part_number_application_to_models_child = ToyotaEpc::PartNumberApplicationToModelsChild.new(params[:toyota_epc_part_number_application_to_models_child])

    respond_to do |format|
      if @toyota_epc_part_number_application_to_models_child.save
        format.html { redirect_to @toyota_epc_part_number_application_to_models_child, :notice => 'Part number application to models child was successfully created.' }
        format.json { render :json => @toyota_epc_part_number_application_to_models_child, :status => :created, :location => @toyota_epc_part_number_application_to_models_child }
      else
        format.html { render :action => "new" }
        format.json { render :json => @toyota_epc_part_number_application_to_models_child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /toyota_epc/part_number_application_to_models_children/1
  # PUT /toyota_epc/part_number_application_to_models_children/1.json
  def update
    @toyota_epc_part_number_application_to_models_child = ToyotaEpc::PartNumberApplicationToModelsChild.find(params[:id])

    respond_to do |format|
      if @toyota_epc_part_number_application_to_models_child.update_attributes(params[:toyota_epc_part_number_application_to_models_child])
        format.html { redirect_to @toyota_epc_part_number_application_to_models_child, :notice => 'Part number application to models child was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @toyota_epc_part_number_application_to_models_child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /toyota_epc/part_number_application_to_models_children/1
  # DELETE /toyota_epc/part_number_application_to_models_children/1.json
  def destroy
    @toyota_epc_part_number_application_to_models_child = ToyotaEpc::PartNumberApplicationToModelsChild.find(params[:id])
    @toyota_epc_part_number_application_to_models_child.destroy

    respond_to do |format|
      format.html { redirect_to toyota_epc_part_number_application_to_models_children_url }
      format.json { head :ok }
    end
  end
end
