class Search < ApplicationRecord

  def lists
    @lists ||= find_lists
  end
  
private
  def find_lists
    lists = List.order(:title)
    lists = lists.where("title like ?", "%#{keywords}%") if keywords.present?
    lists = lists.where(gender: gender) if gender.present?
    lists = lists.where("age >= ?", min_age) if min_age.present?
    lists = lists.where("age <= ?", max_age) if max_age.present?
    lists
  end

end
