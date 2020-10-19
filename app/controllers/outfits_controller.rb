class OutfitsController < ApplicationController

  def index
    outfits = Outfit.all
    render json: OutfitSerializer.new(outfits).to_serialized_json
  end

  def create 
    if params[:name]
      outfit = Outfit.new(outfit_params)
      if outfit.save
        render json: OutfitSerializer.new(outfit).to_serialized_json
      else
        render json: {errors: outfit.errors.full_messages.to_sentence}, status: :unprocessable_entity
      end
    else
      outfit = Outfit.random_outfit
      if outfit.save
        render json: OutfitSerializer.new(outfit).to_serialized_json
      else
        render json: {errors: outfit.errors.full_messages.to_sentence}, status: :unprocessable_entity
      end
    end
  end 

  def update
    if params[:name]
      outfit = Outfit.find_by(id: params[:id])
      if outfit.update(outfit_params)
        render json: OutfitSerializer.new(outfit).to_serialized_json
      else
        render json: {errors: outfit.errors.full_messages.to_sentence}, status: :unprocessable_entity
      end
    else
      outfit = Outfit.find_by(id: params[:id])
      outfit.increase_times_loved
      render json: OutfitSerializer.new(outfit).to_serialized_json
    end
  end

  def destroy
    outfit = Outfit.find_by(id: params[:id])
    if outfit.destroy 
      render json: {message: "Successfully deleted"}
    else
      render json: {error: "There was a problem deleting that outfit."}
    end
  end

  private 

  def outfit_params
    params.permit(:name, :likes, :item_ids => [])
  end 
end
