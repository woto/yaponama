class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => :render_page
  before_filter :is_admin?, :except => :render_page


  def render_page
    @page = Page.where(:path => params[:path]).first
    if @page

      @meta_canonical = '/' + params[:path]
      @meta_title = @page.title
      @meta_description = @page.description
      @meta_keywords = @page.keyword
      @meta_robots = @page.robots
    else
      raise ActionController::RoutingError, "Page #{params[:path]} doesn't exists"
    end
  end

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.order("updated_at DESC").page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new(:path => params[:path].present? ? CGI::unescape(params[:path]) : nil)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, :notice => 'Страница успешно создана' }
        format.json { render :json => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.json { render :json => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, :notice => 'Страница успешно обновлена' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :ok }
    end
  end
end
