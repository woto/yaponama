class MainController < ApplicationController
  def index
    @meta_title = "Добро пожаловать"
    @four_parts_images = Rails.cache.fetch('@four_parts_images', :expires_in => 1.hour) { PartsImage.limit(4).where("id > 52809").order('RAND()').all }
  end
end
