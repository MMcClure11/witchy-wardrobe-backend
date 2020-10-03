class Item < ApplicationRecord
  belongs_to :category

  has_many :outfit_items
  has_many :outfits, through: :outfit_items, dependent: :destroy

  validates :name, :color, :image, :cost, :times_used, :date_purchased, :manufacture_location, :store, presence: true
  validates :name, length: { maximum: 35 }

  scope :sort_by_times_used, -> { order(times_used: :desc)}

  scope :sort_by_color, -> { order(color: :asc)}

  scope :sort_by_cost, -> { order(cost: :desc)}

  def category_name=(name)
    category = Category.find_by(name: name)
    self.category = category
  end

  def category_name
    category.name
  end

  def increase_times_used
    update(times_used: times_used + 1)
  end

  def format_date
    date_purchased.strftime("%b %d, %Y")
  end 

  def self.sort(filtered_items, sort_params)
    case sort_params
      when "alphabetical" then filtered_items.order(:name)
      when "times_used" then filtered_items.sort_by_times_used
      when "color" then filtered_items.sort_by_color 
      when "cost" then filtered_items.sort_by_cost
    end
  end

end
