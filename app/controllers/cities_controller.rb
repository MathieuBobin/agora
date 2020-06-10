class CitiesController < ApplicationController
  
  def show
    puts params
    @city = City.find(params[:id])
    @proposal = @city.proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }
  end

end
