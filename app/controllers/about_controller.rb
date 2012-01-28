class AboutController < ApplicationController
  def index
    content_for :title, "О магазине"
  end
end
