class OutfitsController < ApplicationController

  def index
    outfits = Outfit.all
    render json: OutfitSerializer.new(outfits).to_serialized_json
  
  end

end
