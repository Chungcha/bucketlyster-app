class Follow < ApplicationRecord
  belongs_to :audience, class_name: "User", foreign_key: audience_id
  belongs_to :list

end
