class Item < ApplicationRecord
  belongs_to :list
  has_many :comments, dependent: :destroy
  has_many :audiences, through: :comments

  def self.most_commented
    Item.all.max_by{|item| item.comments.count}
  end

end
