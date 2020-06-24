class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @categories = Category.all
    
    # For proposals filter in city page (data comming from AJAX request, see filter public/filter.js)
    category_ids = params[:category_ids]
    additional_filter = params[:additional_filter]
    
    if (category_ids.nil? && additional_filter.nil?) # no data comming from AJAX request, REST request case
      @proposals = @city.proposals.where(is_online: true).sort { |p1, p2| p2.votes_count <=> p1.votes_count }
    else  # Here are a data comming from AJAX request, so it's an AJAX request
      if category_ids
        @proposals = @city.proposals.where(is_online: true, category_id: category_ids)
        
        case additional_filter
        when '1' #
          @proposals = @proposals.order('created_at').reverse
        when '2' #
          @proposals = @proposals.sort { |p1, p2| p2.votes_count <=> p1.votes_count }
        when '3' #
          @proposals = @proposals.sort { |p1, p2| p2.comments_count <=> p1.comments_count }
        end
      else
        case additional_filter
        when '1' #
          @proposals = @city.proposals.where(is_online: true).order('created_at').reverse
        when '2', '' #
          @proposals = @city.proposals.where(is_online: true).sort { |p1, p2| p2.votes_count <=> p1.votes_count }
        when '3' #
          @proposals = @city.proposals.where(is_online: true).sort { |p1, p2| p2.comments_count <=> p1.comments_count }
        end
      end
    end
  end
end