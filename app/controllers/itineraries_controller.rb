class ItinerariesController < ApplicationController
  def index
  end

  def browse
  end

  def create
    # params[:itineraries][:name] = value
    # params[:spot] = {address: value, description: value}


    user_itineraries = @user.itineraries << Itinerary.create(name: params[:itinerary_name])

    user_itinerary = user_itineraries.last
    user_itinerary.spots << Spot.create(address: params[:spot][:address])
    user_itinerary.userspots << UserSpots.find((description: params[:spot][:address])

  end

  def new
  end

  def favorite
  end

end
