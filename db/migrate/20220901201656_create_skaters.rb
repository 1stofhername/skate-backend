class Skaters < ActiveRecord::Migration[6.1]
  def change
    create_table :skaters do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :category_id
      t.boolean :checkedIn?
      t.integer :skatepark_id
    end
  end
end
