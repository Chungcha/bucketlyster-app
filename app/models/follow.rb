class Follow < ApplicationRecord
  belongs_to :audience, class_name: "User"
  belongs_to :list

end
