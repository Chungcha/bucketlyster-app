class List < ApplicationRecord
  belongs_to :creator, class_name: "User", optional: true
  has_many :follows
  has_many :audiences, through: :follows
  has_many :items
  has_many :comments, through: :items
  
end
