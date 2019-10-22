class User < ApplicationRecord
  has_many :lists, foreign_key: "creator_id"
  has_many :items, through: :lists, foreign_key: "creator_id"
  has_many :follows, through: :lists, foreign_key: "creator_id"
  has_many :loves, class_name: "Follow", foreign_key: "audience_id"
  has_many :comments, foreign_key: "audience_id"
 
  ## As a audience
  has_many :love_lists, :through => :loves, :source => :list
  has_many :creators, :through => :love_lists, :foreign_key => :creator_id

  ## As a creator
  has_many :audiences, :through => :follows, :class_name => "User"

  accepts_nested_attributes_for :lists

  # def lists_attributes=(list_attributes)
  #   list_attributes.values.each do |list_attribute|
  #     if list_attribute[:title].length != 0
  #       list = List.find_or_create_by(list_attribute)
  #       self.lists << list
  #     end
  #   end
  # end

end
