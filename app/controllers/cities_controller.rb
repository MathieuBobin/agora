class CitiesController < ApplicationController
  
  def show
    puts params
    @city = City.find(params[:id])
    @proposal = Proposal.all.where(city_id: @city).sort
  end

end
