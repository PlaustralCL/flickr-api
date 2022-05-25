
class StaticPagesController < ApplicationController
  def index
    image_list = FlickrInterface.photo_search
    @photos = FlickrInterface.get_photos(image_list)
  end
end
