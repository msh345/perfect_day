class FavoritesController < ApplicationController

  def index
    @favorite_itineraries = current_user.favorite_itineraries
  end


  def create
    @itinerary = Itinerary.find(params[:itinerary_id])

    unless current_user.has_favorited?(@itinerary)
      current_user.favorite_itineraries << @itinerary
    end
    redirect_to :back
  end

  def destroy
    Favorite.where(user_id: current_user.id, itinerary_id: params[:itinerary_id]).delete_all
    redirect_to :back
  end


end
