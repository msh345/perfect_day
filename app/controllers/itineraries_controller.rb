class ItinerariesController < ApplicationController
  def index
  end

  def browse
  end

  def create
    puts "********************"
    puts "********************"
    puts params.inspect
    puts "********************"
    puts "********************"
    # user_itinerary = Itinerary.create(itinerary_params)
    # user_itineraries = current_user.itineraries << user_itinerary
    # params[:itineraries_name].each do |spot_params|
    #   spot = Spot.find_or_create_by(address: spot_params[:address])
    #   user_itinerary.spots << spot
    #   itinerary_spot = spot.itinerary_spots.find_by_itinerary_id(user_itinerary.id)
    #   itinerary_spot.update_attributes(description: spot_params[:description])
    # end

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
