class RemoveCategoryFromLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :category, :string
  end
end
