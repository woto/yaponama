class ToyotaEpcPncController < ApplicationController

  def index
    @pnc = Pnc.new
    respond_to do |format|
      format.html
    end
  end

  def search
    @pnc = Pnc.new(params[:pnc])
    if @pnc.valid?
      respond_to do |format|
        format.html {render "search"}
        format.mobile {render "search"}
        format.json {render :json => @pnc.pnc }
      end
    else
      respond_to do |format|
        format.html {render "index"}
        format.mobile {render "index"}
        format.json { render :json => @pnc.errors, :status => :unprocessable_entity }
      end
    end
  end
end
