class List < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: creator_id
  has_many :follows
  has_many :audiences, through: :follows
end
