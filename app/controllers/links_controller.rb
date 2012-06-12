class LinksController < ApplicationController
  require 'open-uri'

  def check
    @link = Link.where(:id => params[:id]).first

    begin
      @link.last_date_check = DateTime.now
      @link.fail_sequence_counter = @link.fail_sequence_counter + 1
      doc = Nokogiri::HTML(open(@link.url))

      if true == eval(@link.template_to_search)
        @link.last_successful_date_check = DateTime.now
        @link.fail_sequence_counter = 0
      end
      respond_to do |format|
        format.html { redirect_to @link, :notice => 'Задача успешно выполнена' }
      end
    rescue Exception => e
      respond_to do |format|
        format.html { redirect_to @link, :notice => "Проверка завершилась не успешно \"#{e}\"" }
      end
    ensure
      @link.save
    end

  end

  # GET /links
  # GET /links.json
  def index
    @links = Link.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @link }
    end
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, :notice => 'Ссылка была успешно создана' }
        format.mobile { redirect_to @link, :notice => 'Ссылка была успешно создана' }
        format.json { render :json => @link, :status => :created, :location => @link }
      else
        format.html { render :action => "new" }
        format.mobile { render :action => "new" }
        format.json { render :json => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to @link, :notice => 'Ссылка была успешно обновлена' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :ok }
    end
  end
end
