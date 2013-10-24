class SpotsController < ApplicationController
  def index
  end

  def show
    # @spot = Spot.find(params[:id])
    @itinerary = Itinerary.find(params[:itinerary_id])
    @itin_spot = ItinerarySpot.find(params[:id])


  end

  def create
  end

  def upvote
    spot = Spot.find(params[:id])
    spot.upvote!
    redirect_to(:back)
  end

  def spot_types
    render json: SpotType.pluck(:name)
  end

end
