class ItemsController < ApplicationController

  def index
    items = Item.all
    render json: ItemSerializer.new(items).to_serialized_json
  end

  def create
    item = Item.new(item_params)
    item.save
    render json: ItemSerializer.new(item).to_serialized_json
  end

  def update
    if params[:name]
      item = Item.find_by(id: params[:id])
      item.update(item_params)
    else
      item = Item.find_by(id: params[:id])
      item.increase_times_used
    end
      render json: ItemSerializer.new(item).to_serialized_json
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
