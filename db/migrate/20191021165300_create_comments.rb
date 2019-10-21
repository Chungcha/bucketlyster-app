class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :audience_id
      t.integer :item_id

      t.timestamps
    end
  end
end
