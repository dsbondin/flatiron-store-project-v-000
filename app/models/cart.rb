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
    if line = line_items.find_by(item_id: item_id)
      line.tap{|line| line.quantity += 1}
    else
      line_items.build(item_id: item_id, quantity: 1)
    end
  end
end
