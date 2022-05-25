require "net/http"
require "json"

class FlickrInterface

  def photos(user_id)
    search_results = photo_search(user_id)
    get_photos(search_results)
  end

  private

  def photo_search(user_id)
    params = { :method => "flickr.photos.search",
               :api_key => Rails.application.credentials.flickrapi[:key],
               :user_id => user_id,
               :format => "json",
               :nojsoncallback => 1 }

    uri = URI("https://www.flickr.com/services/rest/")
    uri.query = URI.encode_www_form(params)
    image_list = Net::HTTP.get(uri)
    image_list = JSON.parse(image_list)
    image_list["photos"]["photo"]
  end

  def photo_uri(image_details)
    server = image_details["server"]
    photo_id = image_details["id"]
    photo_secret = image_details["secret"]
    URI("https://live.staticflickr.com/#{server}/#{photo_id}_#{photo_secret}_q.jpg").to_s
  end

  def get_photos(search_results)
    search_results.map { |image| photo_uri(image) }
  end



end