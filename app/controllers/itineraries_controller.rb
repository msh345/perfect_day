class ItinerariesController < ApplicationController
  def index
  end

  def browse
    @itineraries = Itinerary.all
  end

  def create
    user_itinerary = Itinerary.find_or_create_by(name: params[:name])
    current_user.itineraries << user_itinerary
    params[:spots].each do |key,value|
      spot = Spot.find_or_create_by(name: value[:name], address: value[:address],
                                    phone: value[:phone], latitude: value[:latitude],
                                    longitude: value[:longitude])
      user_itinerary.spots << spot
      itinerary_spot = spot.itinerary_spots.find_by_itinerary_id(user_itinerary.id)
      itinerary_spot.update_attributes(description: value[:description])

      value[:types].each do |type|
        spot.spot_types << SpotType.find_or_create_by(name: type)
      end
    end

    redirect_to user_path(current_user)
  end

  def new
  end

  def spot
  end

  def search

  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def upvote
    itin = Itinerary.find(params[:id])
    itin.upvote!
    redirect_to(:back)
  end
end
