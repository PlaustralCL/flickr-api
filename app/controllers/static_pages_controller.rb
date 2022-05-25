require "net/http"
require "json"

class StaticPagesController < ApplicationController
  def index
    method = "flickr.photos.search"
    api_key = Rails.application.credentials.flickrapi[:key]
    user_id = "31779113@N06"
    format = "json"
    json_callback = 1
    params = { :method => method, :api_key => api_key, :user_id => user_id, :format => format, :nojsoncallback => json_callback }
    uri = URI("https://www.flickr.com/services/rest/")
    uri.query = URI.encode_www_form(params)
    image_list = Net::HTTP.get(uri)
    image_list = JSON.parse(image_list)
    @image_list = image_list["photos"]["photo"]
  end
end
