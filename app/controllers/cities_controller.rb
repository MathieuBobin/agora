class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @categories = Category.all
    @proposals = @city.proposals.where(is_online: true).sort { |p1, p2| p2.votes_count <=> p1.votes_count }
  end
end