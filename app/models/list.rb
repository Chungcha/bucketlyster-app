class List < ApplicationRecord
  belongs_to :creator, class_name: "User", optional: true
  has_many :follows
  has_many :audiences, through: :follows
  has_many :items
  has_many :comments, through: :items
  
  accepts_nested_attributes_for :items
  
  def items_of_status(status)
    items.where(status: status)
  end

  def items_of_category(category)
    items.where(category: category)
  end

  def item_with_the_most_comments
    items.max_by { |item| item.comments.count }
  end

  def self.search(search)
    if search
      # self.where(power_id: power)
      self.all.select {}
      #Lists.all.select { |list| list.title.match(/keyword/)}
    else 
      List.all
    end
  end

end
