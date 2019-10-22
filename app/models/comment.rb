class Comment < ApplicationRecord
  belongs_to :audience, class_name: "User"
  belongs_to :item

end
