class ItemSerializer

  def initialize(item_object)
    @item = item_object
  end

  def to_serialized_json
    @item.to_json(:only => [:id, :name, :color, :image, :cost, :times_used, :date_purchased, :manufacture_location, :store], methods: :format_date,
    :include => {
      :category => {:only => [:name]}
    })
  end
  
end