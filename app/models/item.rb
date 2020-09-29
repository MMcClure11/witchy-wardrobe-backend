class Item < ApplicationRecord
  belongs_to :category

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

end
