class SpotsController < ApplicationController
  def index
  end

  def show
    @spot = Spot.find(params[:id])
    @itinerary = Itinerary.find(params[:itinerary_id])
    @itin_spot = @spot.itinerary_spots.find_by_spot_id(@spot.id)
  end

  def create
  end

  def upvote
    itin_spot = ItinerarySpot.find(params[:itin_spot_id])
    itin_spot.upvote!
    redirect_to(:back)
  end

end
