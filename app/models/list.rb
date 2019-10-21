class List < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"

  has_many :follows
  has_many :users, through: :follows 
  
  has_many :items, source: "list_created"
end
