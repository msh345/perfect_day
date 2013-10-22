class FavoritesController < ApplicationController

  def index
    @favorite_itineraries = current_user.favorite_itineraries
  end


  def create
    type = params[:type]
    # if type == "favorite"
      current_user.favorites << @itineraries
      redirect_to :back, notice: 'You favorited #{@itineraries.name}'
  end

  def destroy
   type == "unfavorite"
      current_user.favorites.delete(@itineraries)
      redirect_to :back, notice: 'Unfavorited #{@itineraries.name}'
  end


end
