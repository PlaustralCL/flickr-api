
class StaticPagesController < ApplicationController
  def index
    test_id = "31779113@N06"
    empty_id = "195750683@N08"
    user_id = test_id
    @sample_id = lucky_id
    if params[:user_id]
      @user_id = params[:user_id]
      @photos = FlickrInterface.new.photos(params[:user_id])
    end
  end

  private

  def lucky_id
    sample_ids = %w[136588110@N03 136698858@N06 13980928@N03 149823649@N03 158551334@N02 31779113@N06 55864922@N05 59782962@N08 72804335@N03 16146765@N08]
    sample_ids.sample
  end


end
