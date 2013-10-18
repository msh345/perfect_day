class ItinerariesController < ApplicationController
  def index
  end

  def browse
  end

  def create
    # user_itineraries = @user.itineraries << Itinerary.create(name: params[:itinerary_name])
    # user_itinerary = user_itineraries.last
    # user_itinerary.spots << Spot.create(address: params[:spot][:address])
    # user_spot = ItinerarySpot.last
    # user_spot.update_attributes(description: params[:spot][:description])
    puts "********************"
    puts "********************"
    puts params.inspect
    puts "********************"
    puts "********************"
    redirect_to new_path
  end

  def new
  end

  def favorite
  end

  def spot
  end

end
