class ItemSerializer
  def initialize(item_object)
    @item = item_object
  end

  def to_serialized_json
    @item.to_json(:except => [:created_at, :updated_at],
    :include => {
      :category => {:only => [:name]}
    })
  end
end