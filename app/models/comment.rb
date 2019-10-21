class Comment < ApplicationRecord
  belongs_to :audience, class_name: "User", foreign_key: audience_id
  belongs_to :item

end
