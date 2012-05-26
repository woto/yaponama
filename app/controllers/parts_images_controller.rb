class PartsImagesController < ApplicationController
  layout false
  skip_before_filter :verify_authenticity_token

  # POST /parts_images
  # POST /parts_images.json
  def create
    @parts_image = PartsImage.new(params[:parts_image])

    respond_to do |format|
      if @parts_image.save
        format.json { render :json => @parts_image.part_image.url, :status => :created }
      else
        format.json { render :json => @parts_image.errors, :status => :unprocessable_entity }
      end
    end
  end

end
