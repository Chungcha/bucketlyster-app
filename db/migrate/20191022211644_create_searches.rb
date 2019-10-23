class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :gender
      t.integer :min_age
      t.integer :max_age

      t.timestamps
    end
  end
end
