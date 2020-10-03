class ItemsController < ApplicationController

  def index
    if params["filter"].present?
      params["filter"] == "all" ? filtered_items = Item.all : filtered_items = Item.where(category: params["filter"])
      sort = case params["sort"]
      when "alphabetical" then items = filtered_items.order(:name)
      when "times_used" then items = filtered_items.sort_by_times_used
      when "color" then items = filtered_items.sort_by_color 
      when "cost" then items = filtered_items.sort_by_cost
      end
    elsif params["query"].present?
        items = Item.where("name LIKE ?", "%#{params[:query]}%")
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
