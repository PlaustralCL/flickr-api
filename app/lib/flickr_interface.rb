require "net/http"
require "json"

class FlickrInterface

  def photos(user_id)
    search_results = photo_search(user_id)
    search_results = add_thumbnail(search_results)
    add_image_link(search_results)
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
    search_results = Net::HTTP.get(uri)
    search_results = JSON.parse(search_results)
    validate_search(search_results)
  end

  def validate_search(search_results)
    if search_results["stat"] == "fail"
      []
    else
      search_results["photos"]["photo"]
    end
  end

  def thumbnail_uri(image_details)
    server = image_details["server"]
    photo_id = image_details["id"]
    photo_secret = image_details["secret"]
    URI("https://live.staticflickr.com/#{server}/#{photo_id}_#{photo_secret}_q.jpg").to_s
  end

  def image_uri(image_details)
    user_id = image_details["owner"]
    photo_id = image_details["id"]
    URI("https://www.flickr.com/photos/#{user_id}/#{photo_id}")
  end

  def add_thumbnail(search_results)
    search_results.each { |image| image["thumbnail"] = thumbnail_uri(image) }
  end

  def add_image_link(search_results)
    search_results.each { |image| image["image_link"] = image_uri(image) }
  end



end