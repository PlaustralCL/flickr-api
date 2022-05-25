require "net/http"
require "json"

class FlickrInterface

  def self.photo_search
    params = { :method => "flickr.photos.search",
               :api_key => Rails.application.credentials.flickrapi[:key],
               :user_id => "31779113@N06",
               :format => "json",
               :nojsoncallback => 1 }

    uri = URI("https://www.flickr.com/services/rest/")
    uri.query = URI.encode_www_form(params)
    image_list = Net::HTTP.get(uri)
    image_list = JSON.parse(image_list)
    image_list["photos"]["photo"]
  end

  def self.photo_uri(server:, photo_id:, photo_secret:)
    uri = URI("https://live.staticflickr.com/#{server}/#{photo_id}_#{photo_secret}_q.jpg").to_s
  end

end