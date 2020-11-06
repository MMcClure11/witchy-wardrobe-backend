class Outfit < ApplicationRecord
  has_many :outfit_items
  has_many :items, through: :outfit_items, dependent: :destroy

  validates :name, :likes, presence: true
  validates :name, length: { maximum: 17 }
  validate :cannot_add_more_than_ten_items

  def cannot_add_more_than_ten_items
    if self.items.count > 10
      errors.add(:item_max, "cannot be more than 10.")
    end
  end

  def increase_times_loved
    self.update(likes: likes + 1)
  end

  def self.random_outfit
    items_array = []
    Category.all.each do |category|
      if category.items.present?
        items_array << category.items.sample
      end
    end

    Outfit.new(name: "New Random Outfit", likes: 0, :items => items_array)
  end

end
