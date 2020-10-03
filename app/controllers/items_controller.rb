class ItemsController < ApplicationController

  def index
    if params["filter"].present?
      params["filter"] == "all" ? filtered_items = Item.all : filtered_items = Item.where(category: params["filter"])
      sorted_items = Item.sort(filtered_items, params["sort"])
      if params["query"].present?
        items = sorted_items.where("name LIKE ?", "%#{params[:query]}%")
      else
        items = sorted_items
      end
    else
        items = Item.all.order(:name)
    end
      render json: ItemSerializer.new(items).to_serialized_json
  end 

  def create
    item = Item.new(item_params)
    if item.save
      render json: ItemSerializer.new(item).to_serialized_json
    else
      render json: {errors: item.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end

  def update
    if params[:name]
      item = Item.find_by(id: params[:id])
      if item.update(item_params)
        render json: ItemSerializer.new(item).to_serialized_json
      else
        render json: {errors: item.errors.full_messages.to_sentence}, status: :unprocessable_entity
      end
    else
      item = Item.find_by(id: params[:id])
      item.increase_times_used
      render json: ItemSerializer.new(item).to_serialized_json
    end
      
  end

  def destroy
    item = Item.find_by(id: params[:id])
    if item.destroy 
      render json: {message: "Successfully deleted"}
    end
  end

  private

  def item_params
    params.permit(:name, :image, :color, :date_purchased, :store, :manufacture_location, :cost, :times_used, :category_name)
  end

end
