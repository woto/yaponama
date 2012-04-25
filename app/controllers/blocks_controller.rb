class BlocksController < ApplicationController

  before_filter :authenticate_user!
  before_filter :is_admin?

  def is_admin?
    unless current_user && current_user.admin?
      redirect_to root_path, :notice => "Вы не администратор"
    end
  end

  # GET /blocks
  # GET /blocks.json
  def index
    @blocks = Block.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @blocks }
    end
  end

  # GET /blocks/1/edit
  def edit
    @block = Block.find(params[:id])
  end

  # PUT /blocks/1
  # PUT /blocks/1.json
  def update
    @block = Block.find(params[:id])

    respond_to do |format|
      if @block.update_attributes(params[:block])
        format.html { redirect_to blocks_path, :notice => 'Блок успешно обновлен' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @block.errors, :status => :unprocessable_entity }
      end
    end
  end

end
