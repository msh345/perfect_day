class SpotsController < ApplicationController
  def index
  end

  def show
    @spot = Spot.find(params[:id])
    @itin_spot = @spot.itinerary_spots.find_by_itinerary_id(params[:itinerary_id])
  end

  def create
  end

  def upvote
    itin_spot = ItinerarySpot.find(params[:itin_spot_id])
    itin_spot.upvote!
    spot = Spot.find(params[:id])
    redirect_to itinerary_spot_path(itin_spot)
  end

end
