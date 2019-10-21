class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :audience_id
      t.integer :list_id

      t.timestamps
    end
  end
end
