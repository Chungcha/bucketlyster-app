class Search < ApplicationRecord

  def find_lists
    lists = List.all
    lists = lists.where("title like ?", "%#{keywords}%") if keywords.present?
    lists = lists.select { |list| list.creator.age >= min_age } if min_age.present?
    lists = lists.select { |list| list.creator.age <= max_age } if max_age.present?
    lists = lists.select { |list| list.creator.gender == gender } if gender.present?
    lists
  end

end
