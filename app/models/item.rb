class Item < ApplicationRecord
  belongs_to :category

  def category_name=(name)
    category = Category.find_by(name: name)
    self.category = category
  end

  def category_name
    category.name
  end
end
