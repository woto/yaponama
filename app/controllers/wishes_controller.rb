class WishesController < ApplicationController
  # GET /wishes
  # GET /wishes.json
  def index
    
    @wishes = user_wishes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @wishes }
    end
  end

  # GET /wishes/1
  # GET /wishes/1.json
  def show
    @wish = Wish.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @wish }
    end
  end

  # # GET /wishes/new
  # # GET /wishes/new.json
  # def new
  #   @wish = Wish.new
  # 
  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render :json => @wish }
  #   end
  # end
  # 
  # # GET /wishes/1/edit
  # def edit
  #   @wish = Wish.find(params[:id])
  # end

  # POST /wishes
  # POST /wishes.json
  def create
    #debugger
    print '1'
    @wish = Wish.new(params[:wish])
    @wish.user = current_user
    @wish.session_id = request.session_options[:id]

    respond_to do |format|
      if @wish.save
        format.html { redirect_to @wish, :notice => 'Wish was successfully created.' }
        #format.json { render :json => @wish, :status => :created, :location => @wish }
        #if request.xhr?
        #  @wishes = Wish.all
        #end
      else
        format.html { render :action => "new" }
        format.json { render :json => @wish.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multiple_update
    debugger
    puts '1'
    Wish.get_for(current_user, request.session_options[:id]).update(params[:wishes].keys, params[:wishes].values)
    redirect_to wishes_path
  end
  
  # # PUT /wishes/1
  # # PUT /wishes/1.json
  # def update
  #   @wish = Wish.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @wish.update_attributes(params[:wish])
  #       format.html { redirect_to @wish, :notice => 'Wish was successfully updated.' }
  #       format.json { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.json { render :json => @wish.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /wishes/1
  # DELETE /wishes/1.json
  def destroy
    @wish = Wish.find(params[:id])
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to wishes_url }
      format.json { head :ok }
    end
  end
end
