class OutfitSerializer

  def initialize(outfit_object)
    @outfit = outfit_object
  end

  def to_serialized_json
    @outfit.to_json(:except => [:created_at, :updated_at],
    :include => {
      :items => {:only => [:name, :image, :id, :color]}
    })
  end
  
end