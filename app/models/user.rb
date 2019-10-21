class User < ApplicationRecord
  has_many :lists_created, class_name: "List", foreign_key: "creator_id"

  has_many :items, foreign_key: "creator_id", dependent: :destroy
  has_many :lists_created, through: :items

  has_many :comments
  has_many :items, through: :comments

  has_many :follows
  has_many :lists, through: :follows

  # def lists_attributes=(list_attributes)
  #   list_attributes.values.each do |list_attribute|
  #     if list_attribute[:title].length != 0
  #       list = List.find_or_create_by(list_attribute)
  #       self.lists << list
  #     end
  #   end
  # end

end
