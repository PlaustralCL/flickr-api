
class StaticPagesController < ApplicationController
  def index
    test_id = "31779113@N06"
    empty_id = "195750683@N08"
    user_id = test_id
    if params[:user_id]
      @user_id = params[:user_id]
      @photos = FlickrInterface.new.photos(params[:user_id])
    end
  end
end
