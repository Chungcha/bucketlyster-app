class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :fullname
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end
