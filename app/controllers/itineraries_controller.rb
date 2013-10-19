class ItinerariesController < ApplicationController
  def index
  end

  def browse
  end

  def create
    user_itineraries = current_user.itineraries << Itinerary.create(itinerary_params)
    user_itinerary = Itinerary.last
    params[:itineraries_name].each do |spot_params|
      user_itinerary.spots << Spot.find_or_create_by(address: spot_params[:address])
      itinerary_spot = ItinerarySpot.last
      itinerary_spot.update_attributes(description: spot_params[:description])
    end

    redirect_to user_path(current_user)
  end

  def new
  end

  def favorite
  end

  def spot
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  private
    def itinerary_params
      params.require(:itineraries).permit(:name)
    end

end
