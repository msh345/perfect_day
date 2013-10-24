class SpotsController < ApplicationController
  def index
  end

  def show
    # @spot = Spot.find(params[:id])
    @itinerary = Itinerary.find(params[:itinerary_id])
    @itin_spot = ItinerarySpot.find(params[:id])
    @spot = Spot.find(@itin_spot.spot_id)

    # other_itineraries = Itinerary.where(id: @itin_spot.itinerary_id)

    # @next_spots = []
    # other_itineraries.each do |itin|
    #   @next_spots << Spot.find(ItinerarySpot.find(itin.itinerary_spots.find_by_spot_id(@spot.id).id+1).spot_id)
    end

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
