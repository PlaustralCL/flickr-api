
class StaticPagesController < ApplicationController
  def index
    image_list = FlickrInterface.photo_search.first
    @photo = FlickrInterface.photo_uri(server: image_list["server"],
                                        photo_id: image_list["id"],
                                        photo_secret: image_list["secret"])
  end
end
