class User < ApplicationRecord
  has_many :lists, foreign_key: :creator_id, dependent: :destroy

  has_many :items, foreign_key: :creator_id, dependent: :destroy
  has_many :lists, through: :items

  has_many :comments, foreign_key: :audience_id, dependent: :destroy
  has_many :items, through: :comments

  has_many :follows, foreign_key: :audience_id, dependent: :destroy
  has_many :lists, through: :follows

end
