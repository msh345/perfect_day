class SpotsController < ApplicationController
  def index
  end

  def show
    @itinerary = Itinerary.find(params[:itinerary_id])
    @itin_spot = ItinerarySpot.find(params[:id])
    @spot = Spot.find(@itin_spot.spot_id)

    @itineraries_with_current_spot = @spot.itineraries

    @next_spots = []

    @itineraries_with_current_spot.each do |itinerary|
      itinerary_spots = itinerary.itinerary_spots
      current_itin_spot_index = itinerary_spots.index {|it_spot| it_spot.spot_id == @spot.id}
      next_itin_spot_index = current_itin_spot_index + 1
      last_index_number = itinerary.itinerary_spots.count - 1
      unless next_itin_spot_index > last_index_number
        next_itin_spot = itinerary_spots[next_itin_spot_index]
        next_spot = Spot.find(next_itin_spot.spot_id)
        @next_spots << next_spot
      end
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
