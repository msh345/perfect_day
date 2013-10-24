class ItinerariesController < ApplicationController
  def index
  end

  def browse
    @itineraries = Itinerary.all
    @distances = {}
    @itineraries.each do |itin|
      distance = Haversine.distance(session[:coords][0], session[:coords][1],
                    itin.spots[0].coords[0], itin.spots[0].coords[1]).to_miles
      @distances[distance] = itin
    end
    @distances = @distances.sort_by {|k,v| k}
    @distances = Hash[*@distances.flatten]
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
    @spot = SpotType.where(name: params[:name]).includes(:spots).pop
    @distances = {}
    if @spot
      @spot.spots.each do |spot|
        distance = Haversine.distance(session[:coords][0], session[:coords][1],
                      spot.coords[0], spot.coords[1]).to_miles
        @distances[distance] = spot
      end
      @distances = @distances.sort_by {|k,v| k}
      @distances = Hash[*@distances.flatten]
    end
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
