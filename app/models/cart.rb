class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    sum = 0
    self.line_items.each do |line|
      sum += line.item.price * line.quantity
    end
    sum
  end

  def add_item(item_id)
    line = line_items.find_or_initialize_by(item_id: item_id)
    line.tap{|line| line.quantity += 1}
  end

  def checkout
    line_items.each do |line|
      item = Item.find_by(id: line.item_id)
      item.inventory -= line.quantity
      item.save
    end
    update(status: "submitted")
  end

end
