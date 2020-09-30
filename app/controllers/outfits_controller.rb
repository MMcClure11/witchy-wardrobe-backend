class OutfitsController < ApplicationController

  def index
    outfits = Outfit.all
    render json: OutfitSerializer.new(outfits).to_serialized_json
  end

  def create 
    outfit = Outfit.new(outfit_params)
    if outfit.save
      render json: OutfitSerializer.new(outfit).to_serialized_json
    else
      render json: {errors: outfit.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end 

  private 

  def outfit_params
    params.permit(:name, :likes, :item_ids => [])
  end 
end
