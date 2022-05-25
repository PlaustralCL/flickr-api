
class StaticPagesController < ApplicationController
  def index
    test_id = "31779113@N06"
    empty_id = "195750683@N08"
    user_id = test_id
    @photos = FlickrInterface.new.photos(user_id)
  end
end
