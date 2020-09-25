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

  def destroy
    item = Item.find_by(id: params[:id])
    if item.destroy 
      render json: {message: "Successfully deleted"}
    end
  end

  private

  def item_params
    params.permit(:name, :category_name)
  end

end
