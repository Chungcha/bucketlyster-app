class Item < ApplicationRecord
  belongs_to :list
  has_many :comments
  has_many :audiences, through: :comments
end
