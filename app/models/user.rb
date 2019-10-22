class User < ApplicationRecord
  has_secure_password
  
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

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  # def lists_attributes=(list_attributes)
  #   list_attributes.values.each do |list_attribute|
  #     if list_attribute[:title].length != 0
  #       list = List.find_or_create_by(list_attribute)
  #       self.lists << list
  #     end
  #   end
  # end

  def most_followed_list_of_me
    my_list = List.all.select { |list| list.creator == self }
    my_list.all.max_by { |list| list.follows.count }
  end

  #find lists of the creators whoes age is +-3 years from me
  def lists_of_my_age_group
    List.all.select { |list| list.creator.age >= self.age - 3 && list.creator.age <= self.age + 3 }
  end

  def lists_of_my_gender
    List.all.select { |list| list.creator.gender == self.gender }
  end

  # def search_lists_with_keyword(keyword)
  #   Lists.all.select { |list| list.title.match(/keyword/)}
  # end


end
