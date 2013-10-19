class ItinerariesController < ApplicationController
  def index
  end

  def browse
  end

  def create
    user_itinerary = Itinerary.create(itinerary_params)
    user_itineraries = current_user.itineraries << user_itinerary
    params[:itineraries_name].each do |spot_params|
      itinerary_spot = Spot.find_or_create_by(address: spot_params[:address])
      user_itinerary.spots << itinerary_spot
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
